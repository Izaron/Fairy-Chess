cmake_minimum_required(VERSION 2.4)
project(SpielMitMir)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")

file(GLOB SOURCE_FILES "src/*cpp")

# include(FindPkgConfig)
# pkg_check_modules(LUAJIT REQUIRED luajit)

find_package(Lua51)
include_directories(${LUA_INCLUDE_DIR})
# include_directories(${LUAJIT_INCLUDE_DIR})
include_directories("/usr/local/include/luajit-2.0")

add_executable(spiel_mit_mir ${SOURCE_FILES})

target_link_libraries(spiel_mit_mir ${LUA_LIBRARIES})
# target_link_libraries(spiel_mit_mir ${LUAJIT_LIBRARIES})
target_link_libraries(spiel_mit_mir luajit-5.1)
