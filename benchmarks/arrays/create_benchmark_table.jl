using PrettyTables

platforms = ["numpy", "c-ext", "julia"]
reference_platform = platforms[1]
benchmarks = ["sum-int8", "sum-int64", "fill-ordered-int8", "fill-ordered-int64", "fill-random-int8", "fill-random-int64"]

frameworks_times = Dict(m => Dict(f => 0.0 for f in platforms) for m in benchmarks)
		  
open("benchmark_results_arrays.txt", "r") do f
    for line in readlines(f)
	!occursin("(ms)", line) && continue
        s_line = split(line)
        !in(s_line[1], platforms) && continue
        frameworks_times[String(s_line[2])][String(s_line[1])] = parse(Float64, s_line[4])
    end
end

frameworks_comparison = Dict(m => Dict(f => 0.0 for f in platforms) for m in benchmarks)
for m in benchmarks
    for f in platforms
        if f == reference_platform
            frameworks_comparison[m][f] = 1
        else
            frameworks_times[m][f] == 0.0 && continue
            v = round(frameworks_times[m][f]/frameworks_times[m][reference_platform], digits=1)
            frameworks_comparison[m][f] = v
        end
    end
end

columns = vcat(["y/x"], platforms)
results = mapreduce(permutedims, vcat, [vcat([m], [ifelse(frameworks_comparison[m][f] != 0, frameworks_comparison[m][f], ".") for f in platforms]) for m in benchmarks])
conf = set_pt_conf(tf = tf_markdown, alignment = :c)
table = pretty_table_with_conf(conf, results; header = columns)