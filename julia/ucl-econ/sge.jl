

println("Started julia")


# ucl_econ_launcher()

# here a function that runs your estimation:
# using MOpt, mig
# 

println("numworkers: $(length(workers()))")
println("workers: $(workers())")
println("make everybody say hello")

@everywhere sayhello()

println("make everybody do some math")

pmap( i->domath(i), [100 for j in 1:length(workers())] )

println("make everybody pass a memory test")

pmap( i->doBIGmath(), 1:length(workers()) )

println("trying parallel for loop with $(nprocs()) processes")
@time map( n -> sum(svd(rand(n,n))[1]) , [800 for i in 1:20]);
@time pmap( n -> sum(svd(rand(n,n))[1]) , [800 for i in 1:20]);

println(" quitting ")

quit()
