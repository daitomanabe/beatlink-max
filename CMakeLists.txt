cmake_minimum_required(VERSION 3.19)

# Set macOS deployment target before project() for C++20 std::format support
if(APPLE)
    set(CMAKE_OSX_DEPLOYMENT_TARGET "13.3" CACHE STRING "Minimum macOS deployment version")
endif()

project(beatlink-max)

# C++20 for beat-link-cpp compatibility
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

enable_testing()

string(REGEX REPLACE "(.*)/" "" THIS_PACKAGE_NAME "${CMAKE_CURRENT_SOURCE_DIR}")

if (APPLE)
    if (${CMAKE_GENERATOR} MATCHES "Xcode")
        if (${XCODE_VERSION} VERSION_LESS 10)
            message(STATUS "Xcode 10 or higher is required. Please install from the Mac App Store.")
            return ()
        elseif(${XCODE_VERSION} VERSION_GREATER_EQUAL 12)
            set(C74_BUILD_FAT YES)
        endif ()
    endif ()

    if (NOT CMAKE_OSX_ARCHITECTURES)
        if(C74_BUILD_FAT)
            set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64" CACHE STRING "macOS architecture" FORCE)
        else()
            set(CMAKE_OSX_ARCHITECTURES ${CMAKE_SYSTEM_PROCESSOR} CACHE STRING "macOS architecture" FORCE)
        endif()
        message("CMAKE_OSX_ARCHITECTURES set to ${CMAKE_OSX_ARCHITECTURES}")
    endif()
endif()

# Find Asio for beat-link-cpp
find_path(ASIO_INCLUDE_DIR asio.hpp
    HINTS
        /usr/local/include
        /opt/homebrew/include
        ${ASIO_ROOT}
)

if(NOT ASIO_INCLUDE_DIR)
    message(STATUS "Asio not found. Fetching from GitHub...")
    include(FetchContent)
    FetchContent_Declare(
        asio
        GIT_REPOSITORY https://github.com/chriskohlhoff/asio.git
        GIT_TAG asio-1-28-0
    )
    FetchContent_MakeAvailable(asio)
    set(ASIO_INCLUDE_DIR ${asio_SOURCE_DIR}/asio/include)
endif()

message(STATUS "Asio include dir: ${ASIO_INCLUDE_DIR}")

# Define ASIO_STANDALONE
add_definitions(-DASIO_STANDALONE)

# Build beat-link-cpp as a static library (without examples/GUI)
set(BEATLINK_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/source/beat-link-cpp/src/Util.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/source/beat-link-cpp/src/DeviceAnnouncement.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/source/beat-link-cpp/src/DeviceFinder.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/source/beat-link-cpp/src/Beat.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/source/beat-link-cpp/src/BeatFinder.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/source/beat-link-cpp/src/DeviceUpdate.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/source/beat-link-cpp/src/CdjStatus.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/source/beat-link-cpp/src/MixerStatus.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/source/beat-link-cpp/src/VirtualCdj.cpp
)

add_library(beatlink_lib STATIC ${BEATLINK_SOURCES})
target_include_directories(beatlink_lib PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/source/beat-link-cpp/include
    ${ASIO_INCLUDE_DIR}
)

# Platform-specific settings for beat-link-cpp
if(APPLE)
    target_compile_definitions(beatlink_lib PRIVATE _DARWIN_C_SOURCE)
    # Force macOS 13.3+ for C++20 std::format support (overrides min-api 10.11 requirement)
    target_compile_options(beatlink_lib PRIVATE -mmacosx-version-min=13.3)
    target_link_options(beatlink_lib PRIVATE -mmacosx-version-min=13.3)
elseif(WIN32)
    target_compile_definitions(beatlink_lib PRIVATE _WIN32_WINNT=0x0601)
    target_link_libraries(beatlink_lib ws2_32)
endif()

# Threading support
find_package(Threads REQUIRED)
target_link_libraries(beatlink_lib Threads::Threads)

# Min-DevKit setup
include(${CMAKE_CURRENT_SOURCE_DIR}/source/min-devkit/source/min-api/script/min-package.cmake)

# Add min-lib if it exists
if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/source/min-devkit/source/min-lib/CMakeLists.txt")
    add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/source/min-devkit/source/min-lib)
endif ()

# Add our beatlink~ project
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/source/projects/beatlink_tilde)

set(CMAKE_SUPPRESS_REGENERATION true)
