cmake_minimum_required(VERSION 3.19)

set(C74_MIN_API_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../min-devkit/source/min-api)
include(${C74_MIN_API_DIR}/script/min-pretarget.cmake)

#############################################################
# MAX EXTERNAL
#############################################################

include_directories(
    "${C74_INCLUDES}"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../source/beat-link-cpp/include"
    "${ASIO_INCLUDE_DIR}"
)

set(SOURCE_FILES
    ${PROJECT_NAME}.cpp
)

add_library(
    ${PROJECT_NAME}
    MODULE
    ${SOURCE_FILES}
)

# Link against our beat-link-cpp library
target_link_libraries(${PROJECT_NAME} PUBLIC beatlink_lib)

# Ensure C++20
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_20)

# macOS 13.3+ for C++20 std::format support
if(APPLE)
    target_compile_options(${PROJECT_NAME} PRIVATE -mmacosx-version-min=13.3)
    target_link_options(${PROJECT_NAME} PRIVATE -mmacosx-version-min=13.3)
endif()

include(${C74_MIN_API_DIR}/script/min-posttarget.cmake)
