/*
 * Copyright (c) 2018 Evgeny Shulgin <izaronplatz@gmail.com>
 * This code is released under the license described in the LICENSE file
 * */
#include <signal.h>

#include <fstream>
#include <iostream>
#include <string>

#include <boost/filesystem.hpp>
#include <boost/stacktrace.hpp>

#include "options.h"
#include "custom_handlers.h"

int main(int argc, char** argv) {
    spiel_mit_mir::init_custom_handlers();

    auto& opt = spiel_mit_mir::get_options();
    opt.init();

    opt.parse_command_line(argc, argv);
    opt.parse_config_file("non-existing-file.what");
    opt.notify();
    std::cout << opt.get_map()["beta"].as<std::string>() << std::endl;
}
