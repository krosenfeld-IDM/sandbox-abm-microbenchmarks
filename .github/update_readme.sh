#!/bin/bash

# Generate output to insert into README
julia --project=@. benchmarks/create_benchmark_table.jl > table.txt

# Replace placeholder in README.md with actual output
awk -v content="$(<table.txt)" '{
    gsub(/<!--dynamic-content-->/, content);
    print;
}' README.md > temp.txt 
mv temp.txt README.md
