/*
 * Copyright (c) 2018 Evgeny Shulgin <izaronplatz@gmail.com>
 * This code is released under the license described in the LICENSE file
 * */
#ifndef SRC_CUSTOM_HANDLERS_H_
#define SRC_CUSTOM_HANDLERS_H_

#include <signal.h>
#include <iostream>
#include <boost/stacktrace.hpp>

namespace spiel_mit_mir {

// TODO(Izaron): Add BOOST_ASSERT handler

/*
 * These functions set custom signals and asserts handlers.
 * They use Boost.Stacktrace library to provide full call stack of
 * the program that have got an exception or failed an assert.
 * */

void custom_signal_handler(int signum);

void init_custom_handlers();

}  // namespace spiel_mit_mir

#endif  // SRC_CUSTOM_HANDLERS_H_
