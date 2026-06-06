/// @file
/// @ingroup    beatlink
/// @copyright  Copyright (c) 2024 Daito Manabe
/// @license    MIT

#include "c74_min.h"
#include <beatlink/BeatLink.hpp>
#include <atomic>
#include <memory>
#include <mutex>
#include <queue>
#include <string>
#include <vector>

using namespace c74::min;

/// A Max external for receiving beat and tempo information from Pioneer DJ equipment
/// via the Pro DJ Link protocol.
class beatlink_tilde : public object<beatlink_tilde> {
public:
    MIN_DESCRIPTION {"Receive beat and tempo from Pioneer DJ equipment via Pro DJ Link"};
    MIN_TAGS        {"network, dj, sync"};
    MIN_AUTHOR      {"Daito Manabe / Rhizomatiks"};
    MIN_RELATED     {"metro, transport"};

    // Inlets
    inlet<>  input  { this, "(bang) poll for updates, (start/stop) control" };

    // Outlets
    outlet<> out_beat       { this, "(bang) outputs on each beat" };
    outlet<> out_downbeat   { this, "(bang) outputs on downbeat (beat 1)" };
    outlet<> out_bpm        { this, "(float) current BPM" };
    outlet<> out_beat_pos   { this, "(int) beat position within bar (1-4)" };
    outlet<> out_device     { this, "(int) device number" };
    outlet<> out_pitch      { this, "(float) pitch adjustment percentage" };
    outlet<> out_info       { this, "(list) device info messages" };

private:
    struct BeatInfo {
        int device_number;
        double bpm;
        int beat_within_bar;
        double pitch_percent;
    };

    struct InfoMessage {
        std::string selector;
        int device_number;
        std::string device_name;
        std::string address;
    };

    struct SharedState {
        std::mutex mutex;
        std::queue<BeatInfo> beat_queue;
        std::queue<InfoMessage> info_queue;
        std::atomic<bool> accepting{true};
        std::atomic<int> device_filter{0};
    };

    std::shared_ptr<SharedState> m_state{std::make_shared<SharedState>()};

public:
    // Attributes
    attribute<bool> autostart { this, "autostart", true,
        description { "Automatically start listening when object is created" }
    };

    attribute<int> filter_device { this, "device", 0,
        description { "Filter to specific device number (0 = all devices)" },
        range { 0, 6 },
        setter { MIN_FUNCTION {
            int value = args[0];
            m_state->device_filter.store(value);
            return {value};
        }}
    };

    // Destructor
    ~beatlink_tilde() {
        stop_impl();
    }

    // Messages
    message<> bang { this, "bang", "Output current state and poll for pending beats",
        MIN_FUNCTION {
            process_pending_beats();
            return {};
        }
    };

    message<> start { this, "start", "Start listening for DJ Link devices and beats",
        MIN_FUNCTION {
            start_impl();
            return {};
        }
    };

    message<> stop { this, "stop", "Stop listening",
        MIN_FUNCTION {
            stop_impl();
            return {};
        }
    };

    message<> devices { this, "devices", "List all discovered devices",
        MIN_FUNCTION {
            list_devices();
            return {};
        }
    };

    message<> status { this, "status", "Output current status",
        MIN_FUNCTION {
            output_status();
            return {};
        }
    };

private:
    // Use loadbang for autostart so Min's registration-time dummy instance does
    // not open network sockets before a real Max object exists.
    message<> loadbang { this, "loadbang", "Start listening when @autostart is enabled",
        MIN_FUNCTION {
            if (autostart) {
                start_impl();
            }
            return {};
        }
    };

    // Timer for polling beats from the queue
    timer<> m_poll_timer { this,
        MIN_FUNCTION {
            process_pending_beats();
            return {};
        }
    };

    std::atomic<bool> m_running{false};
    double m_last_bpm{0.0};

    void start_impl() {
        if (m_running.exchange(true)) {
            cout << "beatlink~: already running" << endl;
            return;
        }

        m_state->accepting.store(true);
        m_state->device_filter.store(filter_device);
        clear_pending_events();
        register_client(m_state);

        if (!beatlink::DeviceFinder::getInstance().start()) {
            cerr << "beatlink~: Failed to start DeviceFinder (port 50000 may be in use)" << endl;
            unregister_client(m_state);
            m_running = false;
            return;
        }

        if (!beatlink::BeatFinder::getInstance().start()) {
            cerr << "beatlink~: Failed to start BeatFinder (port 50001 may be in use)" << endl;
            beatlink::DeviceFinder::getInstance().stop();
            unregister_client(m_state);
            m_running = false;
            return;
        }

        cout << "beatlink~: Started listening on ports 50000/50001" << endl;

        // Start polling timer (10ms interval)
        m_poll_timer.delay(10);
    }

    void stop_impl() {
        if (!m_running.exchange(false)) {
            return;
        }

        m_poll_timer.stop();

        unregister_client(m_state);
        clear_pending_events();

        cout << "beatlink~: Stopped" << endl;
    }

    void process_pending_beats() {
        std::queue<BeatInfo> beats_to_process;
        std::queue<InfoMessage> info_to_process;

        {
            std::lock_guard<std::mutex> lock(m_state->mutex);
            std::swap(beats_to_process, m_state->beat_queue);
            std::swap(info_to_process, m_state->info_queue);
        }

        while (!info_to_process.empty()) {
            const InfoMessage info = info_to_process.front();
            info_to_process.pop();

            atoms as;
            as.push_back(info.selector);
            as.push_back(info.device_number);
            as.push_back(info.device_name);
            as.push_back(info.address);
            out_info.send(as);
        }

        while (!beats_to_process.empty()) {
            BeatInfo info = beats_to_process.front();
            beats_to_process.pop();

            // Output in right-to-left order (Max convention)
            out_pitch.send(info.pitch_percent);
            out_device.send(info.device_number);
            out_beat_pos.send(info.beat_within_bar);
            out_bpm.send(info.bpm);

            // Output downbeat bang if beat 1
            if (info.beat_within_bar == 1) {
                out_downbeat.send("bang");
            }

            // Always output beat bang
            out_beat.send("bang");

            m_last_bpm = info.bpm;
        }

        // Reschedule if still running
        if (m_running) {
            m_poll_timer.delay(10);
        }
    }

    void list_devices() {
        auto& deviceFinder = beatlink::DeviceFinder::getInstance();
        auto devices = deviceFinder.getCurrentDevices();

        if (devices.empty()) {
            out_info.send("devices", 0);
            return;
        }

        for (const auto& device : devices) {
            atoms as;
            as.push_back("device");
            as.push_back(static_cast<int>(device.getDeviceNumber()));
            as.push_back(device.getDeviceName());
            as.push_back(device.getAddress().to_string());
            out_info.send(as);
        }

        out_info.send("devices", static_cast<int>(devices.size()));
    }

    void output_status() {
        atoms as;
        as.push_back("status");
        as.push_back(m_running ? "running" : "stopped");
        as.push_back(m_last_bpm);
        as.push_back(static_cast<int>(active_client_count()));
        out_info.send(as);
    }

    void clear_pending_events() {
        std::lock_guard<std::mutex> lock(m_state->mutex);
        std::queue<BeatInfo> empty_beats;
        std::queue<InfoMessage> empty_info;
        std::swap(m_state->beat_queue, empty_beats);
        std::swap(m_state->info_queue, empty_info);
    }

    static std::mutex& registry_mutex() {
        static std::mutex mutex;
        return mutex;
    }

    static std::vector<std::weak_ptr<SharedState>>& registry_clients() {
        static std::vector<std::weak_ptr<SharedState>> clients;
        return clients;
    }

    static bool& registry_listeners_installed() {
        static bool installed = false;
        return installed;
    }

    static void prune_clients_locked() {
        auto& clients = registry_clients();
        std::vector<std::weak_ptr<SharedState>> live_clients;
        live_clients.reserve(clients.size());

        for (auto& weak_client : clients) {
            if (auto client = weak_client.lock()) {
                if (client->accepting.load()) {
                    live_clients.push_back(client);
                }
            }
        }

        clients.swap(live_clients);
    }

    static void install_global_listeners_locked() {
        if (registry_listeners_installed()) {
            return;
        }

        auto& deviceFinder = beatlink::DeviceFinder::getInstance();
        auto& beatFinder = beatlink::BeatFinder::getInstance();

        deviceFinder.clearListeners();
        beatFinder.clearListeners();

        deviceFinder.addDeviceFoundListener([](const beatlink::DeviceAnnouncement& device) {
            dispatch_device_info("found", device);
        });

        deviceFinder.addDeviceLostListener([](const beatlink::DeviceAnnouncement& device) {
            dispatch_device_info("lost", device);
        });

        beatFinder.addBeatListener([](const beatlink::Beat& beat) {
            dispatch_beat(beat);
        });

        registry_listeners_installed() = true;
    }

    static void register_client(const std::shared_ptr<SharedState>& state) {
        std::lock_guard<std::mutex> lock(registry_mutex());
        prune_clients_locked();
        install_global_listeners_locked();
        registry_clients().push_back(state);
    }

    static void unregister_client(const std::shared_ptr<SharedState>& state) {
        bool should_stop_finders = false;

        {
            std::lock_guard<std::mutex> lock(registry_mutex());
            state->accepting.store(false);
            prune_clients_locked();
            should_stop_finders = registry_clients().empty();
            if (should_stop_finders) {
                registry_listeners_installed() = false;
            }
        }

        if (should_stop_finders) {
            beatlink::BeatFinder::getInstance().stop();
            beatlink::DeviceFinder::getInstance().stop();
            beatlink::BeatFinder::getInstance().clearListeners();
            beatlink::DeviceFinder::getInstance().clearListeners();
        }
    }

    static size_t active_client_count() {
        std::lock_guard<std::mutex> lock(registry_mutex());
        prune_clients_locked();
        return registry_clients().size();
    }

    static std::vector<std::shared_ptr<SharedState>> snapshot_clients() {
        std::lock_guard<std::mutex> lock(registry_mutex());
        prune_clients_locked();

        std::vector<std::shared_ptr<SharedState>> clients;
        for (auto& weak_client : registry_clients()) {
            if (auto client = weak_client.lock()) {
                clients.push_back(client);
            }
        }

        return clients;
    }

    static void dispatch_device_info(const std::string& selector, const beatlink::DeviceAnnouncement& device) {
        InfoMessage info;
        info.selector = selector;
        info.device_number = static_cast<int>(device.getDeviceNumber());
        info.device_name = device.getDeviceName();
        info.address = device.getAddress().to_string();

        for (const auto& client : snapshot_clients()) {
            enqueue_info(client, info);
        }
    }

    static void dispatch_beat(const beatlink::Beat& beat) {
        BeatInfo info;
        info.device_number = beat.getDeviceNumber();
        info.bpm = beat.getEffectiveTempo();
        info.beat_within_bar = beat.getBeatWithinBar();
        info.pitch_percent = beatlink::Util::pitchToPercentage(beat.getPitch());

        for (const auto& client : snapshot_clients()) {
            enqueue_beat(client, info);
        }
    }

    static void enqueue_info(const std::shared_ptr<SharedState>& state, const InfoMessage& info) {
        if (!state->accepting.load()) {
            return;
        }

        std::lock_guard<std::mutex> lock(state->mutex);
        if (state->accepting.load()) {
            state->info_queue.push(info);
        }
    }

    static void enqueue_beat(const std::shared_ptr<SharedState>& state, const BeatInfo& info) {
        if (!state->accepting.load()) {
            return;
        }

        const int filter = state->device_filter.load();
        if (filter > 0 && info.device_number != filter) {
            return;
        }

        std::lock_guard<std::mutex> lock(state->mutex);
        if (state->accepting.load()) {
            state->beat_queue.push(info);
        }
    }
};

MIN_EXTERNAL_CUSTOM(beatlink_tilde, beatlink~);
