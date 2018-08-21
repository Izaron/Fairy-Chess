/*
 * Copyright (c) 2018 Evgeny Shulgin <izaronplatz@gmail.com>
 * This code is released under the license described in the LICENSE file
 * */
#include "custom_handlers.h"

void spiel_mit_mir::custom_signal_handler(int signum) {
    ::signal(signum, SIG_DFL);
    std::cerr << boost::stacktrace::stacktrace() << std::endl;
    ::raise(SIGABRT);
}

void spiel_mit_mir::init_custom_handlers() {
    ::signal(SIGSEGV, &custom_signal_handler);
    ::signal(SIGABRT, &custom_signal_handler);
}
