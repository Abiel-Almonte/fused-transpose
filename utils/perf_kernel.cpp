#include </opt/intel/oneapi/mkl/2025.1/include/mkl.h>
#include <iostream>
#include <cstdlib>
#include <sys/ioctl.h>
#include <unistd.h>
#include <linux/perf_event.h>
#include <sys/syscall.h>
#include <vector>
#include <string>
#include <algorithm>
#include <stdexcept>
#include <iomanip>

extern "C" void transpose_inplace_tiled_simd(float* A, const uint32_t m, const uint32_t stride);

static long perf_event_open(perf_event_attr* pe, int cpu) {
    return syscall(SYS_perf_event_open, pe, 0, cpu, -1, 0);
}

inline unsigned long long pe_cache_wrapper(int cache, int op, int res) {
    return cache | (op << 8) | (res << 16);
}

struct PerfEventManager {
    std::vector<int> fds;
    std::vector<std::string> labels;
    int cpu;

    PerfEventManager(int cpu_id): cpu(cpu_id) {}

    void add_hw_event(const std::string& label, uint64_t config) {
        perf_event_attr pe{};
        pe.size = sizeof(pe);
        pe.disabled = 1;
        pe.exclude_kernel = 1;
        pe.type = PERF_TYPE_HARDWARE;
        pe.config = config;

        int fd = perf_event_open(&pe, cpu);
        if (fd < 0) std::cerr << label << " open failed\n";

        fds.push_back(fd);
        labels.push_back(label);
    }

    void add_cache_event(const std::string& label, int cache, int op, int res) {
        perf_event_attr pe{};
        pe.size = sizeof(pe);
        pe.disabled = 1;
        pe.exclude_kernel = 1;
        pe.type = PERF_TYPE_HW_CACHE;
        pe.config = pe_cache_wrapper(cache, op, res);

        int fd = perf_event_open(&pe, cpu);
        if (fd < 0) std::cerr << label << " open failed\n";

        fds.push_back(fd);
        labels.push_back(label);
    }

    void reset_all()   { for (int fd : fds) ioctl(fd, PERF_EVENT_IOC_RESET, 0); }
    void enable_all()  { for (int fd : fds) ioctl(fd, PERF_EVENT_IOC_ENABLE, 0); }
    void disable_all() { for (int fd : fds) ioctl(fd, PERF_EVENT_IOC_DISABLE, 0); }

    std::vector<long long> read_all(std::vector<long long>& values) {
        for (size_t i = 0; i < fds.size(); ++i) {
            read(fds[i], &values[i], sizeof(long long));
        }
        return values;
    }

    ~PerfEventManager() {
        for (int fd : fds) close(fd);
    }
};

void print_metrics(const std::string& impl, const std::vector<long long>& vals, const std::vector<std::string>& labels, uint32_t iters, uint32_t m) {
    size_t elems = static_cast<size_t>(iters) * m * m;

    long long cycles = -1, insns = -1;
    long long l1_loads = -1, l1_misses = -1;
    long long ll_loads = -1, ll_misses = -1;
    long long dtlb_loads = -1, dtlb_misses = -1;
    long long branches = -1, branch_misses = -1;

    for (size_t i = 0; i < labels.size(); ++i) {
        const auto& lbl = labels[i];
        long long v = vals[i];
        if (lbl == "cycles") cycles = v;
        else if (lbl == "instructions") insns = v;
        else if (lbl == "l1_loads") l1_loads = v;
        else if (lbl == "l1_misses") l1_misses = v;
        else if (lbl == "ll_loads") ll_loads = v;
        else if (lbl == "ll_misses") ll_misses = v;
        else if (lbl == "dtlb_loads") dtlb_loads = v;
        else if (lbl == "dtlb_misses") dtlb_misses = v;
        else if (lbl == "branches") branches = v;
        else if (lbl == "branch_misses") branch_misses = v;
    }

    double ipc = static_cast<double>(insns) / cycles;
    double c_iter = static_cast<double>(cycles) / iters;
    double c_elem = static_cast<double>(cycles) / elems;
    double i_elem = static_cast<double>(insns) / elems;

    double l1rate = static_cast<double>(l1_misses) / l1_loads * 100.0;
    double llrate = static_cast<double>(ll_misses) / ll_loads * 100.0;
    double dtlbrate = static_cast<double>(dtlb_misses) / dtlb_loads * 100.0;
    double brate = static_cast<double>(branch_misses) / branches * 100.0;

    std::cout << impl << '\t' << m << '\t'
              << cycles << '\t' << insns << '\t'
              << ipc << '\t' << c_iter << '\t'
              << c_elem << '\t' << i_elem << '\t'
              << l1_loads << '\t' << l1_misses << '\t'
              << l1rate << '\t' << ll_loads << '\t'
              << ll_misses << '\t' << llrate << '\t'
              << dtlb_loads << '\t' << dtlb_misses << '\t'
              << dtlbrate << '\t' << branches << '\t'
              << branch_misses << '\t' << brate << '\n';
}

constexpr size_t CACHE_LINE_SIZE = 64;
constexpr size_t floats_per_cacheline = CACHE_LINE_SIZE / sizeof(float);

inline size_t get_alloc_size(uint32_t n) {
    size_t lines = (n + floats_per_cacheline - 1) / floats_per_cacheline;
    return lines * CACHE_LINE_SIZE;
}

struct EventDesc {
    bool isCache;
    std::string label;
    int cache, op, res;
    uint64_t config;
};

static uint64_t measureCycles(uint32_t m, uint32_t iters) {
    uint32_t stride = m + floats_per_cacheline;
    size_t total = size_t(m) * (stride);
    float* A = static_cast<float*>(
        aligned_alloc(64, get_alloc_size(total))
    );
    if (!A) {
        std::cerr << "measureCycles: alloc failed\n";
        std::exit(1);
    }
    for (size_t i = 0; i < total; ++i) {
        A[i] = static_cast<float>(i);
    }

    for (uint32_t w = 0; w < 50; ++w) {
        transpose_inplace_tiled_simd(A, m, stride);
    }

    PerfEventManager perf(0);
    perf.add_hw_event("cycles", PERF_COUNT_HW_CPU_CYCLES);
    perf.reset_all();
    perf.enable_all();

    for (uint32_t i = 0; i < iters; ++i) {
        transpose_inplace_tiled_simd(A, m, stride);
    }

    perf.disable_all();
    std::vector<long long> v(1);
    perf.read_all(v);

    free(A);
    return v[0];
}


extern "C" int run_performance_counters(uint32_t m) {
    uint32_t baseIters = 500;
    uint64_t c0 = measureCycles(m, baseIters);
    double cycles_per_iter = double(c0) / double(baseIters);
    uint32_t iters = (100'000'000'000 + cycles_per_iter - 1) / cycles_per_iter;
        
    const int cpu = 0;
    uint32_t stride = m + floats_per_cacheline;
    size_t total = size_t(m) * (stride);
    float* A = static_cast<float*>(aligned_alloc(64, get_alloc_size(total)));
    if (!A) throw std::runtime_error("Allocation failed");

    for (uint32_t i = 0; i < m; ++i)
        for (uint32_t j = 0; j < m; ++j)
            A[i *stride + j] = static_cast<float>(i * m + j);

    std::cout << "implementation\tmatrix_size\tcycles\tinstructions\tIPC\tcycles/iter\t"
              << "cycles/elem\tinsns/elem\tL1_loads\tL1_misses\tL1_miss_rate\t"
              << "LLC_loads\tLLC_misses\tLLC_miss_rate\tDTLB_loads\tDTLB_misses\tDTLB_miss_rate\t"
              << "branches\tbranch_misses\tbranch_miss_rate\n";

    std::vector<EventDesc> events = {
        {false, "cycles", 0, 0, 0, PERF_COUNT_HW_CPU_CYCLES},
        {false, "instructions", 0, 0, 0, PERF_COUNT_HW_INSTRUCTIONS},
        {true, "l1_loads", PERF_COUNT_HW_CACHE_L1D, PERF_COUNT_HW_CACHE_OP_READ, PERF_COUNT_HW_CACHE_RESULT_ACCESS, 0},
        {true, "l1_misses", PERF_COUNT_HW_CACHE_L1D, PERF_COUNT_HW_CACHE_OP_READ, PERF_COUNT_HW_CACHE_RESULT_MISS, 0},
        {true, "ll_loads", PERF_COUNT_HW_CACHE_LL, PERF_COUNT_HW_CACHE_OP_READ, PERF_COUNT_HW_CACHE_RESULT_ACCESS, 0},
        {true, "ll_misses", PERF_COUNT_HW_CACHE_LL, PERF_COUNT_HW_CACHE_OP_READ, PERF_COUNT_HW_CACHE_RESULT_MISS, 0},
        {true, "dtlb_loads", PERF_COUNT_HW_CACHE_DTLB, PERF_COUNT_HW_CACHE_OP_READ, PERF_COUNT_HW_CACHE_RESULT_ACCESS, 0},
        {true, "dtlb_misses", PERF_COUNT_HW_CACHE_DTLB, PERF_COUNT_HW_CACHE_OP_READ, PERF_COUNT_HW_CACHE_RESULT_MISS, 0},
        {false, "branches", 0, 0, 0, PERF_COUNT_HW_BRANCH_INSTRUCTIONS},
        {false, "branch_misses", 0, 0, 0, PERF_COUNT_HW_BRANCH_MISSES}
    };

    std::vector<std::string> labelsOrder;
    for (auto& e : events) labelsOrder.push_back(e.label);

    std::vector<long long> results(events.size(), 0);
    const size_t maxCounters = 4;

    for (size_t i = 0; i < events.size(); i += maxCounters) {
        size_t end = std::min(i + maxCounters, events.size());
        PerfEventManager perf(cpu);

        for (size_t j = i; j < end; ++j) {
            const auto& ev = events[j];
            if (ev.isCache) {
                perf.add_cache_event(ev.label, ev.cache, ev.op, ev.res);
            }else {
                perf.add_hw_event(ev.label, ev.config);
            }
        }

        perf.reset_all(); 
        perf.enable_all();
        for (uint32_t it = 0; it < iters; ++it){
            transpose_inplace_tiled_simd(A, m, stride);
        }
        perf.disable_all();

        std::vector<long long> vals(end - i);
        perf.read_all(vals);
        for (size_t j = i; j < end; ++j) results[j] = vals[j - i];
    }

    print_metrics("custom", results, labelsOrder, iters, m);

    std::fill(results.begin(), results.end(), 0);

    for (int w = 0; w < 50; ++w)
        mkl_simatcopy('R', 'T', m, m, 1.0f, A, stride, stride);

    for (size_t i = 0; i < events.size(); i += maxCounters) {
        size_t end = std::min(i + maxCounters, events.size());
        PerfEventManager perf(cpu);

        for (size_t j = i; j < end; ++j) {
            const auto& ev = events[j];
            if (ev.isCache){
                perf.add_cache_event(ev.label, ev.cache, ev.op, ev.res);
            }else { 
                perf.add_hw_event(ev.label, ev.config);
            }
        }

        perf.reset_all();
        perf.enable_all();

        for (uint32_t it = 0; it < iters; ++it){
            mkl_simatcopy('R', 'T', m, m, 1.0f, A, stride, stride);
        }

        perf.disable_all();

        std::vector<long long> vals(end - i);
        perf.read_all(vals);
        for (size_t j = i; j < end; ++j) results[j] = vals[j - i];
    }

    print_metrics("mkl", results, labelsOrder, iters, m);

    free(A);
    return 0;
}
