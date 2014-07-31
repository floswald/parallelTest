


println("this is julia running")

println("here are the workers")
println(workers())

nn = ENV["PBS_NUM_NODES"]
println("number of nodes:")
println(nn)


@time pmap( n -> sum(svd(rand(n,n))[1]) , [800 for i in 1:24]);

println("quitting")

quit()
