#include <iostream>
#include <fstream>
#include <string>

#include <signal.h>

#include <boost/stacktrace.hpp> 
#include <boost/filesystem.hpp> 

#include "options.h"


void my_signal_handler(int signum) {
    ::signal(signum, SIG_DFL);
    std::cerr << boost::stacktrace::stacktrace() << std::endl;
    ::raise(SIGABRT);
}

using namespace spiel_mit_mir;

int main(int argc, char** argv) {
    if (boost::filesystem::exists("./backtrace.dump")) {
        std::ifstream ifs("./backtrace.dump");

        boost::stacktrace::stacktrace st = boost::stacktrace
            ::stacktrace::from_dump(ifs);
        std::cout << "Previous run crashed:\n" << st << std::endl;

        ifs.close();
        boost::filesystem::remove("./backtrace.dump");
    }

    ::signal(SIGSEGV, &my_signal_handler);
    ::signal(SIGABRT, &my_signal_handler);

    auto& opt = get_options();
    opt.init();

    opt.parse_command_line(argc, argv);
    //opt.parse_config_file("non-existing-file.what");
    opt.notify();
    std::cout << opt.get_map()["beta"].as<std::string>() << std::endl;
}
