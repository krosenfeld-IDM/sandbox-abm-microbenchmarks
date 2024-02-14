# sandbox-abm-microbenchmarks
Sandbox for microbenchmarks

## Results
|        y/x         | julia | numpy | c-ext |
|--------------------|-------|-------|-------|
|      sum-int8      |  1.0  |  4.7  | 20.7  |
|     sum-int64      |  1.0  |  1.2  |  4.8  |
| fill-ordered-int8  |  1.0  |  1.0  | 159.9 |
| fill-ordered-int64 |  1.0  |  2.4  |  9.4  |
|  fill-random-int8  |  1.0  |  1.3  |  1.8  |
| fill-random-int64  |  1.0  |  1.2  |  1.7  |

**References**
- https://github.com/JuliaDynamics/ABMFrameworksComparison/tree/main
