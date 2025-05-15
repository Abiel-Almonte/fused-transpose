#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <stdexcept>
#include <vector>
#include <string>
#include <algorithm>

#include <unistd.h>
#include <sys/syscall.h>
#include <sys/ioctl.h>
#include <linux/perf_event.h>

#include </opt/intel/oneapi/mkl/2025.1/include/mkl.h>

constexpr long long TARGET_CYCLES= 10'000'000'000; //10 Billion
constexpr uint32_t BASE_ITERS= 500;

constexpr uint32_t CACHE_LINE_SIZE= 64;
constexpr uint32_t floats_per_cacheline= CACHE_LINE_SIZE/ sizeof(float);

extern "C" void transpose_inplace_tiled_simd(float* A, const uint32_t m, const float alpha, const uint32_t stride);

inline size_t get_alloc_size(uint32_t n_floats) {
    uint32_t allocated_cache_lines= (n_floats + floats_per_cacheline - 1)/floats_per_cacheline;
    return static_cast<size_t>(allocated_cache_lines* CACHE_LINE_SIZE);
}

long perf_event_open(perf_event_attr* pe, int cpu) {
    return syscall(SYS_perf_event_open, pe, 0, cpu, -1, 0);
}

unsigned long long perf_event_cache_wrapper(int cache, int op, int res) {
    return cache | (op << 8) | (res << 16);
}

struct event {
    std::string label;
    uint64_t config;
    int cache, op, res;
    bool is_cache;

    event(std::string label_, uint64_t config_, int cache_, int op_, int res_, bool is_cache_): 
        label(label_), config(config_), cache(cache_), op(op_), res(res_), is_cache(is_cache_) {}
};

struct perf_event_manager {
    std::vector<std::string> labels;
    std::vector<int> fds;
    int cpu;

    perf_event_manager(int cpu_id): cpu(cpu_id) {}

    void add_hw_event(const std::string& label, uint64_t config) {
        perf_event_attr pe= perf_event_attr();
        pe.size= sizeof(pe);
        pe.disabled= 1;
        pe.exclude_kernel= 1;
        
        pe.type= PERF_TYPE_HARDWARE;
        pe.config= config;

        int fd= perf_event_open(&pe, cpu);
        if (fd < 0){
            std::cerr << "Failed to Open HW Event : " << label << std::endl;
        }

        fds.push_back(fd);
        labels.push_back(label);
    }

    void add_cache_event(const std::string& label, int cache, int op, int res) {
        perf_event_attr pe= perf_event_attr();
        pe.size= sizeof(pe);
        pe.disabled= 1;
        pe.exclude_kernel= 1;

        pe.type= PERF_TYPE_HW_CACHE;
        pe.config= perf_event_cache_wrapper(cache, op, res);

        int fd= perf_event_open(&pe, cpu);
        if (fd < 0){
            std::cerr << "Failed to Open Cache Event : " << label << std::endl;
        }

        fds.push_back(fd);
        labels.push_back(label);
    }

    void reset_all() {
        for (int fd : fds) {
            ioctl(fd, PERF_EVENT_IOC_RESET, 0);
        }
    }

    void enable_all() { 
        for (int fd : fds) { 
            ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);
        }
    }

    void disable_all() { 
        for (int fd : fds) { 
            ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
        }
    }

    auto read_all(std::vector<long long>& values) {
        for (size_t i= 0; i < fds.size(); i++) {
            read(fds[i], &values[i], sizeof(long long));
        }

        return values;
    }
    
    ~perf_event_manager() {
        for (int fd : fds) {
            close(fd);
        }
    }
};

static uint32_t get_iters(const uint32_t m, const uint32_t stride, const float alpha) {
    volatile double trash= 0;
    float* A = static_cast<float*>(aligned_alloc(64, get_alloc_size(m*stride)));

    if (!A) {
        throw std::runtime_error("Aligned Alloc Failed");
    }

    for (uint32_t i= 0; i < m; i++){
        for (uint32_t j= 0; j < m; j++){
            A[i*stride + j]= static_cast<float>(i*m + j); 
        }
    }
    
    for (uint32_t i= 0; i < 50; i++) {
        transpose_inplace_tiled_simd(A, m, alpha, stride);
    }
    
    perf_event_manager perf(0);
    perf.add_hw_event("cycles", PERF_COUNT_HW_CPU_CYCLES);

    perf.reset_all();
    perf.enable_all();
    
    for (uint32_t i= 0; i < BASE_ITERS; i++) {
        transpose_inplace_tiled_simd(A, m, alpha, stride);
    }
    
    perf.disable_all();
    
    for (uint32_t i= 0; i < m; i++){
        for (uint32_t j= 0; j < m; j++){
            trash+= A[i*stride + j]; 
        }
    }

    free(A);
    
    std::vector<long long> values(1); //vector just to read cycles
    perf.read_all(values);

    auto cycles_per_iteration= values[0]/ BASE_ITERS;

    return static_cast<uint32_t>((TARGET_CYCLES + cycles_per_iteration - 1)/ cycles_per_iteration);
}

void print_metrics(const std::string& impl, const std::vector<long long>& values, const std::vector<std::string>& labels, const uint32_t iters, const uint32_t m) {
    size_t elems = static_cast<size_t>(iters) * m * m;
    long long cycles= -1, instructions= -1, l1_loads= -1, l1_misses= -1;
    long long ll_loads= -1, ll_misses= -1, tlb_loads= -1, tlb_misses= -1;
    long long branches= -1, branch_misses= -1;

    for (uint32_t i = 0; i < labels.size(); i++) {
        const auto& label= labels[i];
        const auto value= values[i]; 

        if (label == "cycles"){ cycles= value; }
        else if (label  == "instructions"){ instructions= value; }
        else if (label == "l1_loads"){ l1_loads= value; }
        else if (label == "l1_misses"){ l1_misses= value; }
        else if (label == "ll_loads"){ ll_loads= value; }
        else if (label == "ll_misses"){ ll_misses= value; }
        else if (label == "dtlb_loads"){ tlb_loads= value; }
        else if (label == "dtlb_misses"){ tlb_misses= value; }
        else if (label == "dtlb_loads"){ tlb_loads= value; }
        else if (label == "dtlb_misses"){ tlb_misses= value; }
        else if (label == "dtlb_loads"){ tlb_loads= value; }
        else if (label == "dtlb_misses"){ tlb_misses= value; }
        else if (label == "branches") { branches = value; }
        else if (label == "branch_misses") { branch_misses = value; }
        else {
            std::cerr << "Unknown Label " << label << " Cannot Be Printed" << std::endl;
        }
    }

    double ipc= static_cast<double>(instructions)/ cycles;
    double cycles_per_iteration= static_cast<double>(cycles)/ iters;
    double cycles_per_element= static_cast<double>(cycles)/ elems;
    double elements_per_cycle= 1/ cycles_per_element;
    double instructions_per_element= static_cast<double>(instructions)/ elems;

    double l1_miss_rate= (static_cast<double>(l1_misses)/ l1_loads)* 100.0;
    double ll_miss_rate= (static_cast<double>(ll_misses)/ ll_loads)* 100.0;
    double tlb_miss_rate= (static_cast<double>(tlb_misses)/ tlb_loads)* 100.0;
    double branch_miss_rate= (static_cast<double>(branch_misses)/ branches)* 100.0;

    std::cout << impl << '\t' << m << '\t' << cycles << '\t' << instructions << '\t' << ipc << '\t' << cycles_per_iteration << '\t' << cycles_per_element << "\t"
              << elements_per_cycle << '\t' << instructions_per_element<< '\t' << l1_loads << '\t' << l1_misses << '\t' << l1_miss_rate << '\t'
              << ll_loads << '\t' << ll_misses << '\t' << ll_miss_rate << '\t' << tlb_loads << '\t' << tlb_misses << '\t' << tlb_miss_rate << '\t'
              << branches << '\t' << branch_misses << '\t' << branch_miss_rate << std::endl;
}

extern "C" int run_performance_counters(const uint32_t m, const float alpha) {
    const uint32_t stride= m + floats_per_cacheline;
    const uint32_t iters= get_iters(m, stride, alpha); 
    const int cpu = 0;

    float* A = static_cast<float*>(aligned_alloc(64, get_alloc_size(m*stride)));

    if (!A) {
        throw std::runtime_error("Aligned Alloc Failed");
    }

    for (uint32_t i = 0; i < m; i++) {
        for (uint32_t j = 0; j < m; j++) {
            A[i *stride + j] = static_cast<float>(i * m + j);
        }
    }

    std::cout << "implementation" << "\t" << "size" << "\t" << "cycles" << "\t" << "instructions" << "\t" << "IPC" << "\t" << "cycles/iter" << "\t" << "cycles/elem" << "\t"
              << "elem/cycle" << "\t" << "insns/elem" << "\t" << "L1_loads" << "\t" << "L1_misses" << "\t" << "L1_miss_rate" << "\t"
              << "LLC_loads" << "\t" << "LLC_misses" << "\t" << "LLC_miss_rate" << "\t" << "DTLB_loads" << "\t" << "DTLB_misses" << "\t" << "DTLB_miss_rate" << "\t"
              << "branches" << "\t" << "branch_misses" << "\t" << "branch_miss_rate" << std::endl;

    std::vector<event> events = {
        event("cycles", PERF_COUNT_HW_CPU_CYCLES, 0, 0, 0, false),
        event("instructions", PERF_COUNT_HW_INSTRUCTIONS, 0, 0, 0, false),

        event("l1_loads", 0, PERF_COUNT_HW_CACHE_L1D, PERF_COUNT_HW_CACHE_OP_READ, PERF_COUNT_HW_CACHE_RESULT_ACCESS, true),
        event("l1_misses", 0, PERF_COUNT_HW_CACHE_L1D, PERF_COUNT_HW_CACHE_OP_READ, PERF_COUNT_HW_CACHE_RESULT_MISS, true),

        event("ll_loads", 0, PERF_COUNT_HW_CACHE_LL, PERF_COUNT_HW_CACHE_OP_READ, PERF_COUNT_HW_CACHE_RESULT_ACCESS, true),
        event("ll_misses", 0, PERF_COUNT_HW_CACHE_LL, PERF_COUNT_HW_CACHE_OP_READ, PERF_COUNT_HW_CACHE_RESULT_MISS, true),

        event("dtlb_loads", 0, PERF_COUNT_HW_CACHE_DTLB, PERF_COUNT_HW_CACHE_OP_READ, PERF_COUNT_HW_CACHE_RESULT_ACCESS, true),
        event("dtlb_misses", 0, PERF_COUNT_HW_CACHE_DTLB, PERF_COUNT_HW_CACHE_OP_READ, PERF_COUNT_HW_CACHE_RESULT_MISS, true),

        event("branches", PERF_COUNT_HW_BRANCH_INSTRUCTIONS, 0, 0, 0, false),
        event("branch_misses", PERF_COUNT_HW_BRANCH_MISSES, 0, 0, 0, false)
    };

    std::vector<long long> results(events.size(), 0);
    std::vector<std::string> labels;
    for (auto& e : events) {
        labels.push_back(e.label);
    }

    
    for (int i= 0; i < 50; i++){
        transpose_inplace_tiled_simd(A, m, alpha, stride);
    }
    
    const size_t max_counters= 4;
    for (size_t i= 0; i < events.size(); i += max_counters) {
        size_t end = std::min(i + max_counters, events.size());
        perf_event_manager perf(cpu);

        for (size_t j= i; j < end; j++) {
            const auto& event = events[j];
            if (event.is_cache) {
                perf.add_cache_event(event.label, event.cache, event.op, event.res);
            }else {
                perf.add_hw_event(event.label, event.config);
            }
        }

        perf.reset_all(); 
        perf.enable_all();

        for (uint32_t i= 0; i < iters; i++){
            transpose_inplace_tiled_simd(A, m, alpha, stride);
        }

        perf.disable_all();

        std::vector<long long> values(end - i);
        perf.read_all(values);

        for (size_t j= i; j < end; ++j){
            results[j]= values[j - i];
        }
    }

    print_metrics("custom", results, labels, iters, m);

    std::fill(results.begin(), results.end(), 0);

    for (int i= 0; i < 50; i++){
        mkl_simatcopy('R', 'T', m, m, alpha, A, stride, stride);
    }

    for (size_t i = 0; i < events.size(); i += max_counters) {
        size_t end = std::min(i + max_counters, events.size());
        perf_event_manager perf(cpu);

        for (size_t j = i; j < end; ++j) {
            const auto& event = events[j];
            if (event.is_cache){
                perf.add_cache_event(event.label, event.cache, event.op, event.res);
            }else { 
                perf.add_hw_event(event.label, event.config);
            }
        }

        perf.reset_all();
        perf.enable_all();

        for (uint32_t i= 0; i < iters; i++){
            mkl_simatcopy('R', 'T', m, m, alpha, A, stride, stride);
        }

        perf.disable_all();

        std::vector<long long> vals(end - i);
        perf.read_all(vals);

        for (size_t j= i; j < end; j++) { 
            results[j]= vals[j - i];
        }
    }

    print_metrics("mkl", results, labels, iters, m);

    free(A);
    return 0;
}
