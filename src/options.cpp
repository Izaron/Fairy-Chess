#include "options.h"

#include <iostream>
#include <string>
#include <utility>

#include <boost/exception/diagnostic_information.hpp> 

namespace spiel_mit_mir {

namespace opt = boost::program_options;

options &get_options() {
    return options::get_mutable_instance();
}

void options::init() {
    desc_.add_options()
        // TODO: real options
        ("alpha", opt::value<int>()->default_value(13071999), "what's this?")
        ("beta", opt::value<std::string>()->required(), "or this?")

        ("help", "produce help message")
    ;
}

void options::parse_command_line(int argc, char** argv) {
    opt::store(opt::parse_command_line(argc, argv, desc_), var_map_);
}

void options::parse_config_file(boost::string_view file) {
    opt::store(
        opt::parse_config_file<char>(
            file.data(),
            desc_
        ),
    var_map_);
}

void options::notify() {
    // Throws an exception if one of the required options
    // was not set
    opt::notify(var_map_);
}

const decltype(options::var_map_)& options::get_map() {
    return var_map_;
}

}  // spiel_mit_mir
