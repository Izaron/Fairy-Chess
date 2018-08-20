extern "C" {
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#include <luajit.h>
}

#include <iostream>

int main() {
    lua_State* state = luaL_newstate();

    if (luaL_loadfile(state, "script.lua") || lua_pcall(state, 0, 0, 0)) {
        std::cerr << "Error" << std::endl;
        return 0;
    }

    lua_close(state);

    return 0;
}
