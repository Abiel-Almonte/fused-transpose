#include </opt/intel/oneapi/mkl/2025.1/include/mkl.h>
#include <iostream>
#include <cstdlib>
#include <chrono>
#include <vector>
#include <algorithm>
#include <cstring>
#include <cmath>

extern "C" void transpose_inplace_tiled_simd(float* A, const uint32_t m, const uint32_t stride);

constexpr size_t CACHE_LINE_SIZE= 64;
constexpr size_t floats_per_cacheline= CACHE_LINE_SIZE/ sizeof(float);

inline size_t get_alloc_size(uint32_t n_floats){
    size_t allocated_cache_lines= (n_floats + floats_per_cacheline - 1)/floats_per_cacheline;
    return allocated_cache_lines* CACHE_LINE_SIZE;
}

static uint32_t autoTuneTimeIters(uint32_t m) {
    using Clock = std::chrono::high_resolution_clock;
    constexpr uint32_t WARMUP     = 10;
    constexpr double   TARGET_SEC = 0.5;     // 100 ms target window
    constexpr uint32_t MIN_ITERS  = 5;
    constexpr uint32_t MAX_ITERS  = 1'000'000;

    uint32_t stride = m + floats_per_cacheline;
    size_t total = size_t(m) * (stride);
    float* A = static_cast<float*>(
        aligned_alloc(64, get_alloc_size(total))
    );
    if (!A) {
        std::cerr << "autoTuneTimeIters: alloc failed\n";
        std::exit(1);
    }
    for (size_t i = 0; i < m*m; ++i) {
        A[i] = static_cast<float>(i);
    }

    for (uint32_t w = 0; w < WARMUP; ++w) {
        transpose_inplace_tiled_simd(A, m, stride);
    }

    auto t0 = Clock::now();
    transpose_inplace_tiled_simd(A, m, stride);
    auto t1 = Clock::now();
    std::free(A);

    double sec0 = std::chrono::duration<double>(t1 - t0).count();

    uint32_t iters = uint32_t(std::ceil(TARGET_SEC / sec0));
    iters = std::clamp(iters, MIN_ITERS, MAX_ITERS);
    return iters;
}

extern "C" int run_timing_benchmark(uint32_t m) {
    uint32_t iters = autoTuneTimeIters(m);
    const uint32_t warmup= 50;
    const uint64_t bytes_transferred= static_cast<uint64_t>(m) * (m-1) / 2 * 16;
    
    uint32_t stride = m + floats_per_cacheline;
    size_t total = size_t(m) * (stride);
    float* A1= static_cast<float*>(aligned_alloc(64, get_alloc_size(total)));
    float* A2= static_cast<float*>(aligned_alloc(64, get_alloc_size(total)));
    
    if (!A1 || !A2) {
        std::cerr << "Memory allocation failed\n";
        exit(EXIT_FAILURE);
    }
    
    for (uint32_t i= 0; i < m; i++) {
        for (uint32_t j= 0; j < m; j++) {
            A1[i*stride + j]= A2[i*stride + j]= static_cast<float>(i*m + j);
        }
    }
    
    std::vector<uint64_t> custom_times(iters);
    std::vector<uint64_t> mkl_times(iters);
    
    for (uint32_t w= 0; w < warmup; ++w) {
        transpose_inplace_tiled_simd(A1, m, stride);
        mkl_simatcopy('R', 'T', m, m, 1.0f, A2, stride, stride);
    }
    
    for (uint32_t i= 0; i < iters; i++) {
        for (uint32_t r= 0; r < m; r++) {
            for (uint32_t c= 0; c < m; c++) {
                A1[r*stride + c]= static_cast<float>(r*m + c);
            }
        }
        
        auto start= std::chrono::high_resolution_clock::now();
        transpose_inplace_tiled_simd(A1, m, stride);
        auto end= std::chrono::high_resolution_clock::now();
        
        custom_times[i]= std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
    }
    
    for (uint32_t i= 0; i < iters; i++) {
        for (uint32_t r= 0; r < m; r++) {
            for (uint32_t c= 0; c < m; c++) {
                A2[r*stride + c]= static_cast<float>(r*m + c);
            }
        }
        
        auto start= std::chrono::high_resolution_clock::now();
        mkl_simatcopy('R', 'T', m, m, 1.0f, A2, stride, stride);
        auto end= std::chrono::high_resolution_clock::now();
        
        mkl_times[i]= std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
    }
    
    std::sort(custom_times.begin(), custom_times.end());
    std::sort(mkl_times.begin(), mkl_times.end());
    
    uint64_t custom_p10= custom_times[static_cast<size_t>(iters * 0.1)];
    uint64_t custom_median= custom_times[iters/2];
    uint64_t custom_p90= custom_times[static_cast<size_t>(iters * 0.90)];
    
    uint64_t mkl_p10= mkl_times[static_cast<size_t>(iters * 0.1)];
    uint64_t mkl_median= mkl_times[iters/2];
    uint64_t mkl_p90= mkl_times[static_cast<size_t>(iters * 0.90)];
    
    double custom_bw_p10= bytes_transferred / (double)custom_p10;  // GB/s
    double custom_bw_median= bytes_transferred / (double)custom_median;
    double custom_bw_p90= bytes_transferred / (double)custom_p90;

    
    double mkl_bw_p10= bytes_transferred / (double)mkl_p10;
    double mkl_bw_median= bytes_transferred / (double)mkl_median;
    double mkl_bw_p90= bytes_transferred / (double)mkl_p90;

    
    std::cout << "implementation\tmatrix_size\tbytes\tp10_ns\tmedian_ns\tp90_ns\tbw_p10_GB/s\tbw_median_GB/s\tbw_p90_GB/s\n";
    std::cout << "custom\t" << m << "\t" << bytes_transferred << "\t" 
              << custom_p10 << "\t" << custom_median << "\t" << custom_p90 << "\t"
              << custom_bw_p10 << "\t" << custom_bw_median << "\t" << custom_bw_p90 << "\n";
    
    std::cout << "mkl\t" << m << "\t" << bytes_transferred << "\t" 
              << mkl_p10 << "\t" << mkl_median << "\t" << mkl_p90 << "\t"
              << mkl_bw_p10 << "\t" << mkl_bw_median << "\t" << mkl_bw_p90 << "\n";
    
    bool matrices_equal= true;
    for (uint32_t r = 0; r < m; ++r){
        for (uint32_t c = 0; c < m; ++c){
            if (std::abs(A1[r*stride + c] - A2[r*stride + c]) > 1e-5)
            matrices_equal = false;
        }
    }
    
    if (!matrices_equal) {
        std::cerr << "WARNING: Matrix results differ between implementations\n";
    }
    
    free(A1);
    free(A2);
    
    return 0;
}