
println("Started julia on ucl legion")

# include("launcher.jl")

# bind_iridis_procs(8)  # bind 8 procs per node

# here a function that runs your estimation:
# using MOpt, mig

# require some code on all nodes
# require("../incl.jl")

println("make everybody say hello")

@everywhere sayhello()

println("make everybody do some math")

pmap( i->domath(i), [100 for j in 1:length(workers())] )

println("make everybody pass a memory test")

pmap( i->doBIGmath(10000,10000), 1:length(workers()) )
# pmap( i->doBIGmath(20000,10000), 1:length(workers()) )
# pmap( i->doBIGmath(30000,10000), 1:length(workers()) )

println("trying parallel for loop with $(nprocs()) processes")
println("numworkers: $(length(workers()))")
println("workers: $(workers())")
@time map( n -> sum(svd(rand(n,n))[1]) , [800 for i in 1:32]);
@time pmap( n -> sum(svd(rand(n,n))[1]) , [800 for i in 1:32]);

println(" quitting ")

quit()