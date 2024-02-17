
echo "Benchmarking queues"
(
echo "Benchmarking heapq"
python benchmarks/queues/heapq/benchmark_priority_queues.py

echo "Benchmarking julia"
julia --project=@. benchmarks/queues/julia/benchmark_priority_queues.jl

) | tee benchmark_results_queues.txt

# julia --project=@. create_benchmark_table.jl