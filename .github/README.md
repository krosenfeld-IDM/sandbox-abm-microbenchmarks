# sandbox-abm-microbenchmarks
Sandbox for microbenchmarks

## Results
|        y/x         | julia | numpy | c-ext |
|--------------------|-------|-------|-------|
|      sum-int8      |  1.0  |  5.0  | 20.8  |
|     sum-int64      |  1.0  |  1.3  |  4.8  |
| fill-ordered-int8  |  1.0  |  1.0  | 201.6 |
| fill-ordered-int64 |  1.0  |  2.3  |  8.9  |
|  fill-random-int8  |  1.0  |  1.3  |  1.8  |
| fill-random-int64  |  1.0  |  1.2  |  1.5  |

**References**
- https://github.com/JuliaDynamics/ABMFrameworksComparison/tree/main
