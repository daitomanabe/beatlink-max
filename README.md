# beatlink~

Max/MSP external for receiving beat and tempo information from Pioneer DJ equipment via the Pro DJ Link protocol.

## Features

- Automatic discovery of Pioneer DJ equipment on the network
- Real-time beat and tempo information
- Outputs: beat bangs, downbeat bangs, BPM, beat position (1-4), device number, pitch adjustment
- Filter by device number

## Building

### Requirements

- CMake 3.19+
- Xcode (macOS) or Visual Studio (Windows)
- C++20 compatible compiler

### macOS

```bash
mkdir build && cd build
cmake .. -G Xcode
cmake --build . --config Release
```

### Windows

```bash
mkdir build && cd build
cmake .. -G "Visual Studio 17 2022"
cmake --build . --config Release
```

## Usage

The `beatlink~` object has the following inlets and outlets:

### Inlets
- **Inlet 1**: Control messages (bang, start, stop, devices, status)

### Outlets (left to right)
1. **beat**: Bang on each beat
2. **downbeat**: Bang on beat 1 (downbeat)
3. **bpm**: Current BPM (float)
4. **beat_pos**: Beat position within bar, 1-4 (int)
5. **device**: Device number (int)
6. **pitch**: Pitch adjustment percentage (float)
7. **info**: Device info and status messages (list)

### Messages
- `start`: Start listening for DJ Link devices
- `stop`: Stop listening
- `devices`: List all discovered devices
- `status`: Output current status
- `bang`: Poll for pending beat updates

### Attributes
- `@autostart 1/0`: Automatically start on object creation (default: 1)
- `@device N`: Filter to specific device number, 0 = all (default: 0)

## Example

```
[beatlink~ @device 1]
|         |         |        |         |        |        |
[bang]    [bang]    [float]  [int]     [int]    [float]  [route found lost device status]
beat      downbeat  bpm      beat_pos  device   pitch    info
```

## Credits

- Beat Link C++ library: https://github.com/daitomanabe/beat-link-cpp
- Original Java Beat Link: https://github.com/Deep-Symmetry/beat-link
- Min-DevKit: https://github.com/Cycling74/min-devkit

## License

MIT License
