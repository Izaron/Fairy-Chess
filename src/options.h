#ifndef SRC_OPTIONS_H_
#define SRC_OPTIONS_H_

#include <string>
#include <memory>

#include <boost/program_options.hpp>
#include <boost/serialization/singleton.hpp>
#include <boost/utility/string_view.hpp>

namespace spiel_mit_mir {

/*
 * This is another case of using an antipattern Singleton
 * instead of global functions and variables. Just because I can.
 *
 * The options class loads config from command line arguments 
 * or from files.
 *
 * The class isn't thread-safe - lock it always when using in multiple
 * threads
 *
 * Example of thread-safe code (in a scope):
 *    std::lock_guard<std::mutex> lock(some_mutex);
 *    auto& opt = get_options();
 *    // options::lock()     <--- not mandatory, proves thread safety
 *    std::cout << opt.get_map()["some-arg"] << std::endl;
 *    // options::unlock()   <--- not mandatory, proves thread safety
 * */
class options : public boost::serialization::singleton<options> {
  private:
    // Stores all passed arguments in a hash map
    boost::program_options::variables_map var_map_;

    // Used to define all options and their descriptions and properties
    //std::shared_ptr<boost::program_options::options_description> desc_;
    boost::program_options::options_description desc_;

  public:
    // In order to be used as singleton<T> , the type T must be default
    // constructable.
    options() {}

    // Builds the option list with all stuff
    void init();

    // Parses arguments from `int main(...)`
    bool parse_command_line(int argc, char** argv);

    // Parses arguments from config files, usually with .cfg extension
    bool parse_config_file(boost::string_view file);

    // Should be called after we've parsed all needed sources
    // Returns 'false' if a required variable wasn't provided
    // it's critical to have all required values
    bool notify();

    // Variables map getter
    const decltype(var_map_)& get_map();
};

// Used to access the singleton in a more convenient way
options &get_options();

}  // spiel_mit_mir

#endif  // SRC_OPTIONS_H_
