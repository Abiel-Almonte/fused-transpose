cmake_minimum_required(VERSION 3.8)

project(hpit LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(hpit
    main.cpp
    ./utils/perf_kernel.cpp
    ./utils/time_kernel.cpp
    transpose_inplace_tiled_simd.cpp
)

target_include_directories(hpit PRIVATE /opt/intel/oneapi/mkl/2025.1/include)
target_compile_options(hpit PRIVATE -O3 -march=native -ffast-math)

target_link_libraries(hpit PRIVATE
    # mkl libs
    mkl_intel_lp64
    mkl_sequential
    mkl_core
    pthread
    m
    dl
)