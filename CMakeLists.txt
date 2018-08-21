# Boost 1.68 requires CMake 3.12 or newer
cmake_minimum_required(VERSION 3.12)
project(SpielMitMir)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -Wall")

file(GLOB SOURCE_FILES "src/*cpp")

# Definitions
add_definitions(-DBOOST_STACKTRACE_USE_BACKTRACE)

# Lua
find_package(Lua 5.3 REQUIRED)
include_directories(${LUA_INCLUDE_DIR})

# Boost
find_package(Boost 1.68 COMPONENTS program_options
    serialization system stacktrace_backtrace filesystem REQUIRED)
include_directories(${Boost_INCLUDE_DIRS})

# Threads
find_package(Threads)

# Executable
add_executable(spiel_mit_mir ${SOURCE_FILES})

target_link_libraries(spiel_mit_mir ${LUA_LIBRARIES})
target_link_libraries(spiel_mit_mir ${Boost_LIBRARIES})
target_link_libraries(spiel_mit_mir "pthread")
target_link_libraries(spiel_mit_mir "dl")
target_link_libraries(spiel_mit_mir "backtrace")
