# sandbox-abm-microbenchmarks
Sandbox for microbenchmarks

## Results

### Arrays
|        y/x         | numpy | c-ext | julia |
|--------------------|-------|-------|-------|
|      sum-int8      |  1.0  |  4.2  |  0.2  |
|     sum-int64      |  1.0  |  4.5  |  0.9  |
| fill-ordered-int8  |  1.0  | 97.3  |  0.8  |
| fill-ordered-int64 |  1.0  |  2.4  |  0.4  |
|  fill-random-int8  |  1.0  |  1.4  |  0.8  |
| fill-random-int64  |  1.0  |  1.4  |  0.8  |

### Queues
|   y/x   | heapq |  dict  | julia |
|---------|-------|--------|-------|
|  build  |  1.0  |  1.01  | 0.02  |
|   pop   |  1.0  | 13.43  | 0.03  |
| deplete |  1.0  | 490.21 | 0.35  |

**References**
- https://github.com/JuliaDynamics/ABMFrameworksComparison/tree/main
