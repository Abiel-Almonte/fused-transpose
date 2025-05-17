cmake_minimum_required(VERSION 3.8)

project(hpit LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(FORCE_AVX2 "Enable AVX2 256-bit vectors in kernel" OFF)
if(FORCE_AVX2)
  add_compile_definitions(FORCE_AVX2)
endif()

if (NOT CMAKE_SYSTEM_NAME STREQUAL "Linux")
    add_executable(hpit
        main.cpp
        ./utils/time_kernel.cpp
        transpose_inplace_tiled_simd.cpp
    )
else()
    add_executable(hpit
        main.cpp
        ./utils/perf_kernel.cpp
        ./utils/time_kernel.cpp
        transpose_inplace_tiled_simd.cpp
    )
endif()


if(CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64|i[3-6]86")
    set(IS_X86 TRUE)
elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|arm")
    set(IS_ARM TRUE)
endif()

if (IS_X86)
    target_include_directories(hpit PRIVATE /opt/intel/oneapi/mkl/2025.1/include)
    target_link_libraries(hpit PRIVATE
        mkl_intel_lp64
        mkl_sequential
        mkl_core
        pthread
        m
        dl
    )
elseif(IS_ARM)
    target_include_directories(hpit PRIVATE /opt/homebrew/opt/openblas/include)
    find_library(OPENBLAS_LIB openblas PATHS /opt/homebrew/opt/openblas/lib)
    target_link_libraries(hpit PRIVATE ${OPENBLAS_LIB})
endif()

if(APPLE)
    target_link_libraries(hpit PRIVATE c++)
endif()

target_compile_options(hpit PRIVATE -O3 -march=native -ffast-math)