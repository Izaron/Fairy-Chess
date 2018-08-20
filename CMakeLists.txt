cmake_minimum_required(VERSION 2.4)
project(SpielMitMir)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")

file(GLOB SOURCE_FILES "src/*cpp")

find_package(Lua 5.3)
include_directories(${Lua_INCLUDE_DIRS})

add_executable(spiel_mit_mir ${SOURCE_FILES})

target_link_libraries(spiel_mit_mir ${ImageMagick_LIBRARIES})
