#!/bin/bash

(
echo "Benchmarking numpy"
python arrays/numpy/benchmark_arrays.py

echo "Benchmarking julia"
julia --project=@. arrays/julia/benchmark_arrays.jl

echo "Benchmarking c-extensions"
python arrays/c-extension/benchmark_arrays.py

) | tee benchmark_results.txt

julia --project=@. create_benchmark_table.jl