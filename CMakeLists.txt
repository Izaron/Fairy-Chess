cmake_minimum_required(VERSION 2.4)
project(SpielMitMir)

set(CMAKE_BUILD_TYPE Debug)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")

file(GLOB SOURCE_FILES "src/*cpp")

# Lua
find_package(Lua 5.3 REQUIRED)
include_directories(${LUA_INCLUDE_DIR})

# Boost
find_package(Boost COMPONENTS program_options serialization REQUIRED)
include_directories(${Boost_INCLUDE_DIRS})

# Threads
find_package(Threads)

add_executable(spiel_mit_mir ${SOURCE_FILES})

target_link_libraries(spiel_mit_mir ${LUA_LIBRARIES})
target_link_libraries(spiel_mit_mir ${Boost_LIBRARIES})
target_link_libraries(spiel_mit_mir "pthread")
