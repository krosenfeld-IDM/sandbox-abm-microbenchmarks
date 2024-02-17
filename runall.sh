#!/bin/bash

(
echo "Benchmarking arrays"
echo "python..."
python benchmarks/arrays/numpy/benchmark_arrays.py
echo "julia..."
julia --project=@. benchmarks/arrays/julia/benchmark_arrays.jl
echo "c-extension..."
python benchmarks/arrays/c-extension/benchmark_arrays.py


) | tee benchmark_results_arrays.txt

julia --project=@. benchmarks/arrays/create_benchmark_table.jl

(

echo "Benchmarking queues"
echo "heapq..."
python benchmarks/queues/heapq/benchmark_priority_queues.py
echo "julia..."
julia --project=@. benchmarks/queues/julia/benchmark_priority_queues.jl

) | tee benchmark_results_queues.txt

julia --project=@. benchmarks/queues/create_benchmark_table.jl
