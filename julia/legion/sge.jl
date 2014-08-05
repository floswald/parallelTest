function bind_legion_procs()
  # filestream = open(ENV["PBS_NODEFILE"])
  home = ENV["HOME"]
  node_file_name = ENV["PE_HOSTFILE"]

  # parse the file - extract addresses and number of procs
  # on each
  # filestream = open("pe_file_ex.txt")
  filestream = open(node_file_name)
  seekstart(filestream)
  linearray = readlines(filestream)
  node_file = map(x->strip(x,['\n']),linearray)

    # get number of workers on each node
    procs = Dict{ASCIIString,Int}()
    for n in node_file
        procs[n] = get(procs,n,0) + 1
    end

    println("name of compute nodes and number of workers:")
    println(procs)

    # add processes on master itself
    master = ENV["HOSTNAME"]

    if procs[master] > 1
        addprocs(procs[master]-1)
        println("added $(procs[master]-1) processes on master itself")
    end

    # get a machine file for other hosts
    machines = ASCIIString[]
    for i in 1:length(node_file)
        if node_file[i] != master
            push!(machines,node_file[i])
        end
    end

  println("adding machines to current system")
  addprocs(machines, dir= JULIA_HOME )
  println("done")
end

println("Started julia on legion. binding workers now")

bind_legion_procs()

# require some code on all nodes
require("../incl.jl")

println("make everybody say hello")

@everywhere sayhello()

println("make everybody do some math")

println(pmap( i->domath(i), [100 for j in 1:length(workers())] ))
# here a function that runs your estimation:
# using MOpt, mig
# 

println("trying parallel for loop with $(nprocs()) processes")
println("numworkers: $(length(workers()))")
println("workers: $(workers())")

# warm up JIT
map( n -> sum(svd(rand(n,n))[1]) , [80 for i in 1:20]);
pmap( n -> sum(svd(rand(n,n))[1]) , [80 for i in 1:20]);

println("map time:")
@time map( n -> sum(svd(rand(n,n))[1]) , [80 for i in 1:20]);
println("pmap time:")
@time pmap( n -> sum(svd(rand(n,n))[1]) , [80 for i in 1:20]);

println(" quitting ")

quit()
