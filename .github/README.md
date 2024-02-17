# sandbox-abm-microbenchmarks
Sandbox for microbenchmarks

## Results
|        y/x         | julia | numpy | c-ext |
|--------------------|-------|-------|-------|
|      sum-int8      |  1.0  |  4.7  | 20.7  |
|     sum-int64      |  1.0  |  1.4  |  5.2  |
| fill-ordered-int8  |  1.0  |  1.3  | 121.0 |
| fill-ordered-int64 |  1.0  |  2.3  |  5.5  |
|  fill-random-int8  |  1.0  |  1.3  |  1.9  |
| fill-random-int64  |  1.0  |  1.2  |  1.6  |

**References**
- https://github.com/JuliaDynamics/ABMFrameworksComparison/tree/main
