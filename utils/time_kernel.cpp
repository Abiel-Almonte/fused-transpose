#include <iostream>
#include <cstdlib>
#include <chrono>
#include <cmath>
#include <vector>
#include <algorithm>

#include </opt/intel/oneapi/mkl/2025.1/include/mkl.h>

constexpr double TARGET_SEC= 0.5;
constexpr uint32_t BASE_ITER= 500;
constexpr uint32_t CACHE_LINE_SIZE= 64;
constexpr uint32_t floats_per_cacheline= CACHE_LINE_SIZE/ sizeof(float); //16

extern "C" void transpose_inplace_tiled_simd(float* A, const uint32_t m, const uint32_t stride);

inline size_t get_alloc_size(uint32_t n_floats){
    uint32_t allocated_cache_lines= (n_floats + floats_per_cacheline - 1)/floats_per_cacheline;
    return static_cast<size_t>(allocated_cache_lines* CACHE_LINE_SIZE);
}

static uint32_t get_iters(const uint32_t m, const uint32_t stride) {
    std::vector<double> timings_s(BASE_ITER); //seconds
    volatile double trash= 0;

    float* A= static_cast<float*>(aligned_alloc(CACHE_LINE_SIZE, get_alloc_size(m*stride)));

    if (!A) {
        throw std::runtime_error("Aligned Alloc Failed");
    }
    
    for (uint32_t i = 0; i < m; i++) {
        for (uint32_t j= 0; j < m; j++){
            A[i*stride + j]= static_cast<float>(i*m + j);
        }
    }

    for (uint32_t i = 0; i < 50; i++) {
        transpose_inplace_tiled_simd(A, m, stride);
    }

    for (uint32_t i = 0; i < BASE_ITER; i++){
        auto start= std::chrono::high_resolution_clock::now();
        transpose_inplace_tiled_simd(A, m, stride);
        auto end= std::chrono::high_resolution_clock::now();

        double latency_ns= std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
        timings_s[i]= latency_ns* 1e-9;

        for (uint32_t ii = 0; ii < m; ii++) {
            for (uint32_t jj= 0; jj < m; jj++){
                trash+= A[ii*stride + jj];
            }
        }
    }

    std::free(A);
    
    std::sort(timings_s.begin(), timings_s.end());
    uint32_t p50_index= BASE_ITER*50u/100u;
    double seconds_per_iteration= timings_s[p50_index];
    
    return static_cast<uint32_t>(std::ceil(TARGET_SEC/ seconds_per_iteration));
}

extern "C" int run_timing_benchmark(const uint32_t m) {
    const uint32_t stride= m + floats_per_cacheline;
    const uint32_t iters= get_iters(m, stride);
    const uint64_t bytes= static_cast<uint64_t>(((m * (m-1))/2)* sizeof(float) * 4); // 2 loads 2 stores
    volatile double trash= 0;
    
    float* A_custom= static_cast<float*>(aligned_alloc(CACHE_LINE_SIZE, get_alloc_size(m*stride)));
    float* A_mkl= static_cast<float*>(aligned_alloc(CACHE_LINE_SIZE, get_alloc_size(m*stride)));
    
    if (!A_custom || !A_mkl) {
        throw std::runtime_error("Aligned Alloc Failed");
    }
    
    for (uint32_t i= 0; i < m; i++) {
        for (uint32_t j= 0; j < m; j++) {
            float val=  static_cast<float>(i*m + j);

            A_custom[i*stride + j]= val;
            A_mkl[i*stride + j]= val;
        }
    }
    
    std::vector<double> custom_timings_ns(iters);
    std::vector<double> mkl_timings_ns(iters);
    
    for (uint32_t i= 0; i < 50; i++) {
        transpose_inplace_tiled_simd(A_custom, m, stride);
        mkl_simatcopy('R', 'T', m, m, 1.0f, A_mkl, stride, stride);
    }
    
    for (uint32_t i= 0; i < iters; i++) {
        for (uint32_t ii= 0; ii < m; ii++) {
            for (uint32_t jj= 0; jj < m; jj++) {
                A_custom[ii*stride + jj]= static_cast<float>(ii*m + jj);
            }
        }
        
        auto start= std::chrono::high_resolution_clock::now();
        transpose_inplace_tiled_simd(A_custom, m, stride);
        auto end= std::chrono::high_resolution_clock::now();
        
        custom_timings_ns[i]= std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
        
        for (uint32_t ii= 0; ii < m; ii++) {
            for (uint32_t jj= 0; jj < m; jj++) {
                trash+= A_custom[ii*stride + jj];
            }
        }
        
    }
    
    for (uint32_t i= 0; i < iters; i++) {
        for (uint32_t ii= 0; ii < m; ii++) {
            for (uint32_t jj= 0; jj < m; jj++) {
                A_mkl[ii*stride + jj]= static_cast<float>(ii*m + jj);
            }
        }
        
        auto start= std::chrono::high_resolution_clock::now();
        mkl_simatcopy('R', 'T', m, m, 1.0f, A_mkl, stride, stride);
        auto end= std::chrono::high_resolution_clock::now();
        
        mkl_timings_ns[i]= std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
    }
    
    //sanity check
    for (uint32_t i = 0; i < m; i++){
        for (uint32_t j = 0; j < m; j++){
            float got= A_custom[i*stride + j];
            float want= A_mkl[i*stride + j];
            
            if (std::abs(got - want) > 1e-5f){
                std::cerr << "Sanity Check Failed: want " << want << " got " << got << std::endl;
                exit(EXIT_FAILURE);
            }
        }
    }
    
    std::free(A_custom);
    std::free(A_mkl);
    
    std::sort(custom_timings_ns.begin(), custom_timings_ns.end());
    std::sort(mkl_timings_ns.begin(), mkl_timings_ns.end());
    
    uint32_t p10_index= iters*10u/100u;
    uint32_t p50_index= iters*50u/100u;
    uint32_t p90_index= iters*90u/100u;

    double custom_p10_latency_ns= custom_timings_ns[p10_index]; //best case sustained, smaller
    double custom_p50_latency_ns= custom_timings_ns[p50_index];
    double custom_p90_latency_ns= custom_timings_ns[p90_index]; //worst case sustained, larger

    double mkl_p10_latency_ns= mkl_timings_ns[p10_index];
    double mkl_p50_latency_ns= mkl_timings_ns[p50_index];
    double mkl_p90_latency_ns= mkl_timings_ns[p90_index];
    
    double custom_p10_bandwidth= static_cast<double>(bytes/(custom_p10_latency_ns)); //best case sustained, larger
    double custom_p50_bandwidth= static_cast<double>(bytes/(custom_p50_latency_ns));
    double custom_p90_bandwidth= static_cast<double>(bytes/(custom_p90_latency_ns)); //worst cast sustained, smaller
    
    double mkl_p10_bandwidth= static_cast<double>(bytes/(mkl_p10_latency_ns));
    double mkl_p50_bandwidth= static_cast<double>(bytes/(mkl_p50_latency_ns));
    double mkl_p90_bandwidth= static_cast<double>(bytes/(mkl_p90_latency_ns));

    std::cout << "implementation" << "\t" << "size"  << "\t" << "p10_latency_ns" << "\t" << "p50_latency_ns" << "\t" <<"p90_latency_ns"
              <<  "\t" << "p10_bandwidth" << "\t" << "p50_bandwidth" << "\t" << "p90_bandwidth"  << std::endl;

    std::cout << "custom" << "\t" << m << "\t" << custom_p10_latency_ns << "\t" << custom_p50_latency_ns << "\t" << custom_p90_latency_ns
              << "\t" << custom_p10_bandwidth << "\t" << custom_p50_bandwidth << "\t" << custom_p90_bandwidth << std::endl;

    std::cout << "mkl" << "\t" << m << "\t" << mkl_p10_latency_ns << "\t" << mkl_p50_latency_ns << "\t" << mkl_p90_latency_ns
              << "\t" << mkl_p10_bandwidth << "\t" << mkl_p50_bandwidth << "\t" << mkl_p90_bandwidth << std::endl;
    
    return 0;
}