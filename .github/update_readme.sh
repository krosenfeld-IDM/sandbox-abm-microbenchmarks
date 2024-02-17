#!/bin/bash

# Generate output to insert into README
julia --project=@. benchmarks/arrays/create_benchmark_table.jl > table.txt

# Replace placeholder in README.md with actual output
awk -v content="$(<table.txt)" '{
    gsub(/<!--dynamic-content-arrays-->/, content);
    print;
}' README.md > README.md 

# Generate output to insert into README
julia --project=@. benchmarks/queues/create_benchmark_table.jl > table.txt

# Replace placeholder in README.md with actual output
awk -v content="$(<table.txt)" '{
    gsub(/<!--dynamic-content-queues-->/, content);
    print;
}' README.md > temp.txt 
mv temp.txt .github/README.md
