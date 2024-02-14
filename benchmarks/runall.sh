#!/bin/bash

(
echo "Benchmarking arrays"
echo "python..."
python arrays/numpy/benchmark_arrays.py
echo "julia..."
julia --project=@. arrays/julia/benchmark_arrays.jl
echo "c-extension..."
python arrays/c-extension/benchmark_arrays.py
) | tee benchmark_results.txt

julia --project=@. create_benchmark_table.jl