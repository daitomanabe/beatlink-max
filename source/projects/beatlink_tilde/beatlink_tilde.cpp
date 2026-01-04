/// @file
/// @ingroup    beatlink
/// @copyright  Copyright 2024 Daito Manabe / Rhizomatiks. All rights reserved.
/// @license    MIT

#include "c74_min.h"
#include <beatlink/BeatLink.hpp>
#include <atomic>
#include <mutex>
#include <queue>

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

    // Attributes
    attribute<bool> autostart { this, "autostart", true,
        description { "Automatically start listening when object is created" }
    };

    attribute<int> filter_device { this, "device", 0,
        description { "Filter to specific device number (0 = all devices)" },
        range { 0, 6 }
    };

    // Constructor
    beatlink_tilde() {
        // Schedule initialization for the main thread
        m_init_timer.delay(100);
    }

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
    // Timer for deferred initialization
    timer<> m_init_timer { this,
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

    // Thread-safe queue for beats received from network thread
    struct BeatInfo {
        int device_number;
        double bpm;
        int beat_within_bar;
        double pitch_percent;
    };

    std::mutex m_beat_mutex;
    std::queue<BeatInfo> m_beat_queue;

    std::atomic<bool> m_running{false};
    double m_last_bpm{0.0};

    void start_impl() {
        if (m_running.exchange(true)) {
            cout << "beatlink~: already running" << endl;
            return;
        }

        auto& deviceFinder = beatlink::DeviceFinder::getInstance();
        auto& beatFinder = beatlink::BeatFinder::getInstance();

        // Set up device listeners
        deviceFinder.addDeviceFoundListener([this](const beatlink::DeviceAnnouncement& device) {
            // Queue device found message
            atoms as;
            as.push_back("found");
            as.push_back(static_cast<int>(device.getDeviceNumber()));
            as.push_back(device.getDeviceName());
            as.push_back(device.getAddress().to_string());
            // Note: We can't safely call outlet from network thread
            // This will be handled via the info outlet in the main thread
        });

        deviceFinder.addDeviceLostListener([this](const beatlink::DeviceAnnouncement& device) {
            // Queue device lost message
        });

        // Set up beat listener
        beatFinder.addBeatListener([this](const beatlink::Beat& beat) {
            int device_num = beat.getDeviceNumber();
            int filter = filter_device;

            // Filter by device if specified
            if (filter > 0 && device_num != filter) {
                return;
            }

            BeatInfo info;
            info.device_number = device_num;
            info.bpm = beat.getEffectiveTempo();
            info.beat_within_bar = beat.getBeatWithinBar();
            info.pitch_percent = beatlink::Util::pitchToPercentage(beat.getPitch());

            {
                std::lock_guard<std::mutex> lock(m_beat_mutex);
                m_beat_queue.push(info);
            }
        });

        // Start finders
        if (!deviceFinder.start()) {
            cerr << "beatlink~: Failed to start DeviceFinder (port 50000 may be in use)" << endl;
            m_running = false;
            return;
        }

        if (!beatFinder.start()) {
            cerr << "beatlink~: Failed to start BeatFinder (port 50001 may be in use)" << endl;
            deviceFinder.stop();
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

        auto& deviceFinder = beatlink::DeviceFinder::getInstance();
        auto& beatFinder = beatlink::BeatFinder::getInstance();

        beatFinder.stop();
        deviceFinder.stop();

        cout << "beatlink~: Stopped" << endl;
    }

    void process_pending_beats() {
        std::queue<BeatInfo> beats_to_process;

        {
            std::lock_guard<std::mutex> lock(m_beat_mutex);
            std::swap(beats_to_process, m_beat_queue);
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
        out_info.send(as);
    }
};

MIN_EXTERNAL(beatlink_tilde);
