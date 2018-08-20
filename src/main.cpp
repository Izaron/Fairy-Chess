#include <iostream>
#include <string>

#include "options.h"

using namespace spiel_mit_mir;

int main(int argc, char** argv) {
    auto& opt = get_options();
    opt.init();

    if (!opt.parse_command_line(argc, argv)) {
        return 2;
    }

    if (!opt.parse_config_file("non-existing-file.what")) {
        return 2;
    }

    if (!opt.notify()) {
        return 2;
    } else {
        std::cout << opt.get_map()["beta"].as<std::string>() << std::endl;
    }
}
