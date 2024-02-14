#!/bin/bash

(
echo "Benchmarking numpy"
python benchmarks/arrays/numpy/benchmark_arrays.py

echo "Benchmarking julia"
julia --project=@. benchmarks/arrays/julia/benchmark_arrays.jl

echo "Benchmarking c-extensions"
python benchmarks/arrays/c-extension/benchmark_arrays.py

) | tee benchmark_results.txt

julia --project=@. benchmarks/create_benchmark_table.jl