#!/bin/bash

# Generate output to insert into README
output=$(julia --project=@. benchmarks/create_benchmark_table.jl)

# Placeholder in README to replace with output
placeholder="<!--dynamic-content-->"

# Replace placeholder in README.md with actual output
sed -i "s|$placeholder|$output|g" README.md