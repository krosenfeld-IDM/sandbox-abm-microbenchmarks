using BenchmarkTools
using Random

#######################
# Array access
function access_ordered(a::AbstractArray, n::Integer)
    for i in 1:n
        a[i] += 1
    end
end

function access_random(a::AbstractArray, max_n::Integer, n::Integer)
    for i in 1:n
        j = rand(1:max_n)
        a[j] += 1
    end
end

function access_inds(a::AbstractArray, inds::AbstractArray, c::Integer)
    for i in eachindex(inds)
        a[inds[i]] = c
    end
end
#######################

suite = BenchmarkGroup()

suite["Array Access"] = BenchmarkGroup()
max_n = 10^7
a = ones(Int64, max_n)
inds = 1:max_n
shuffle_inds = shuffle(inds)
suite["Array Access"]["Ordered.Int64"] = @benchmarkable access_inds($a, $inds, Int64(1))
suite["Array Access"]["Random.Int64"] = @benchmarkable access_inds($a, $shuffle_inds, Int64(1))
a = ones(Int8, max_n)
suite["Array Access"]["Ordered.Int8"] = @benchmarkable access_inds($a, $inds, Int8(1))
suite["Array Access"]["Random.Int8"] = @benchmarkable access_inds($a, $shuffle_inds, Int8(1))

tune!(suite)
results = run(suite, verbose = true)

BenchmarkTools.save("output.json", median(results))
