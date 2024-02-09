using BenchmarkTools

#######################
# Array access
function access_ordered(a::AbstractArray, max_n::Integer, n::Integer)
    @inbounds for i in 1:n
        j = rand(1:max_n) # doe not seem to effect
        a[i] += 1
    end
end

function access_random(a::AbstractArray, max_n::Integer, n::Integer)
    @inbounds for i in 1:n
        j = rand(1:max_n)
        a[j] += 1
    end
end
#######################

suite = BenchmarkGroup()

suite["Array Access"] = BenchmarkGroup()
max_n = 10^7
n = 10^4
a = zeros(Int64, max_n)
suite["Array Access"]["Ordered"] = @benchmarkable access_ordered($a, max_n, n)
suite["Array Access"]["Random"] = @benchmarkable access_random($a, max_n, n)

tune!(suite)
results = run(suite, verbose = true)

BenchmarkTools.save("output.json", median(results))
