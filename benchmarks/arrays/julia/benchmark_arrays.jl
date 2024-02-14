using BenchmarkTools 
using Random

platform = "julia"

######################
# Sum over 10e7 array

a = Int8.(rand(1:2, 10^7))
b = @benchmark sum($a) 
println("$platform sum-int8 (ms): ", median(b.times) * 1e-6)

a = Int64.(rand(1:2, 10^7))
b = @benchmark sum($a) 
println("$platform sum-int64 (ms): ", median(b.times) * 1e-6)

#####################
# Set array elements (fill)

a = zeros(Int8, 10^7)
b = @benchmark fill!($a, 1)
println("$platform fill-ordered-int8 (ms): ", median(b.times) * 1e-6)

a = zeros(Int64, 10^7)
b = @benchmark fill!($a, 1)
println("$platform fill-ordered-int64 (ms): ", median(b.times) * 1e-6)

#####################
# Set array elements (random)
n = 10^7
inds = shuffle(1:n)

a = zeros(Int8, n)
b = @benchmark $a[$inds] .= 1
println("$platform fill-random-int8 (ms): ", median(b.times) * 1e-6)

a = zeros(Int64, n)
b = @benchmark $a[$inds] .= 1
println("$platform fill-random-int64 (ms): ", median(b.times) * 1e-6)
