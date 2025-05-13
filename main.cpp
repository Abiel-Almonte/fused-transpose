#include <iostream>
#include <string>
#include <cstdlib>
#include <cstdint>

extern "C" int run_performance_counters(uint32_t m);
extern "C" int run_timing_benchmark(uint32_t m);

void pin_to_cpu(int cpu_id) {
    cpu_set_t cpu_set;
    CPU_ZERO(&cpu_set);
    CPU_SET(cpu_id, &cpu_set);
    int rv= sched_setaffinity(0, sizeof(cpu_set_t), &cpu_set);
    if(rv < 0){
        std::cout << "Failed to pin to cpu" << std::endl;
        exit(EXIT_FAILURE);
    }
}


int main(int argc, char** argv) {
    if (argc < 3) {
        std::cerr << "Usage: " << argv[0] << " <mode> <matrix_size>\n";
        std::cerr << "'perf' or 'time'\n";
        std::cerr << "matrix_size\n";
        return 1;
    }
    
    pin_to_cpu(0);

    std::string mode= argv[1];
    uint32_t matrix_size= std::atoi(argv[2]);

    if (mode == "perf") {
        return run_performance_counters(matrix_size);
    } 
    else if (mode == "time") {
        return run_timing_benchmark(matrix_size);
    } 
}