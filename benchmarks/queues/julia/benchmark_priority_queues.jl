using BenchmarkTools
using QuickHeaps

platform = "julia"

function build_heap(N, q_max=365*100)
    h = QuickHeaps.PriorityQueue{Int64, Vector}()
    for i in 1:N
        k = Int64.(rand(1:q_max))
        if haskey(h, k)
            h[k] = push!(h[k], i)
        else
            enqueue!(h, k, [i])
        end
    end
    return h
end


######################
# Build queue

b = @benchmark build_heap(10^3) 
println("$platform build (ms): ", median(b.times) * 1e-6)

######################
# Pop queue

b = @benchmark pop!(ch) setup=(ch = build_heap(10^5)) evals=1
println("$platform pop (ms): ", median(b.times) * 1e-6)

######################
# Pop all

function pop_all!(h)
    cnt = 0
    while !isempty(h)
        p = pop!(h)
        for v in p[2]
            cnt += 1
        end
    end
end
b = @benchmark pop_all!(ch) setup=(ch = build_heap(10^5)) evals=1
println("$platform deplete (ms): ", median(b.times) * 1e-6)
