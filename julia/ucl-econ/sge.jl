

println("Started julia")

include("launcher.jl")

ucl_econ_launcher()

# here a function that runs your estimation:
# using MOpt, mig
# 

# println("trying parallel for loop with $(nprocs()) processes")
# println("numworkers: $(length(workers()))")
# println("workers: $(workers())")
# @time map( n -> sum(svd(rand(n,n))[1]) , [800 for i in 1:20]);
# @time pmap( n -> sum(svd(rand(n,n))[1]) , [800 for i in 1:20]);

println(" quitting ")

quit()