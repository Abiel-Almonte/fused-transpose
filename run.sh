#!/bin/bash

set -e

mkdir -p "build"

CC=clang-17 CXX=clang++-17 cmake -G "Unix Makefiles" -B ./build -S .
cmake --build ./build -- -j$(nproc)

MATRIX_SIZES=(15 16 31 32 63 64 127 128 255 256 511 512 1023 1024 2047 2048)
matrix_size=64
use_perf=false
use_time=false
sweep=false

while [[ $# -gt 0 ]]; do
  case $1 in
    -m)
      matrix_size="$2"
      shift 2
      ;;
    -p)
      use_perf=true
      shift
      ;;
    -t)
      use_time=true
      shift
      ;;
    -s)
      sweep=true
      shift
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: $0 [-m matrix_size] [-i iterations] [-p] [-t]"
      echo "  -m: Matrix dimension (default: 64)"
      echo "  -p: Use performance counters"
      echo "  -t: Time kernel for bandwidth"
      echo "  -s: sweep matrix sizes"
      exit 1
      ;;
  esac
done

mkdir -p results/perf
mkdir -p results/time

if [ "$sweep" = true ]; then
  for size in "${MATRIX_SIZES[@]}"; do
    echo "Benchmarking matrix size ${size}"
    
    if [ "$use_time" = true  ]; then
      output_file="./results/time/${size}.tsv"
      ./build/hpit time "$size"
      ./build/hpit time "$size"
      ./build/hpit time "$size" > "$output_file"
    elif [ "$use_perf" = true ]; then
      output_file="./results/perf/${size}.tsv"
      ./build/hpit perf "$size"
      ./build/hpit perf "$size"
      ./build/hpit perf "$size" > "$output_file"
    else
      exit 1
    fi

  done
else
  
  if [ "$use_perf" = true ]; then
    echo "Benchmarking matrix size ${matrix_size}"
    ./build/hpit perf "$matrix_size"
  elif [ "$use_time" = true ]; then
    echo "Benchmarking matrix size ${matrix_size}"
    ./build/hpit time "$matrix_size"
  else
    exit 1
  fi
  
fi