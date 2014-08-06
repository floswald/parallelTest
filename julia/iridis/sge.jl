function bind_iridis_procs()

    home = ENV["HOME"]

     # find out what cluster we are on
    node_file_name = ENV["PBS_NODEFILE"]

    # read PBS_NODEFILE
    filestream = open(node_file_name)
    seekstart(filestream)
    node_file = readlines(filestream)

    # strip eol
    node_file = map(x->strip(x,['\n']),node_file)

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


    println("processes on worker machines:")
    println(machines)

    # add to julia home
    println("adding machines to JULIA_HOME: $JULIA_HOME")

    for m in machines
        addprocs([m], dir= JULIA_HOME)
    end
    println("done")
end

println("Started julia on iridis")

bind_iridis_procs()

# here a function that runs your estimation:
# using MOpt, mig

# require some code on all nodes
require("../incl.jl")

println("make everybody say hello")

@everywhere sayhello()

println("make everybody do some math")

pmap( i->domath(i), [100 for j in 1:length(workers())] )


println("trying parallel for loop with $(nprocs()) processes")
println("numworkers: $(length(workers()))")
println("workers: $(workers())")
@time map( n -> sum(svd(rand(n,n))[1]) , [800 for i in 1:20]);
@time pmap( n -> sum(svd(rand(n,n))[1]) , [800 for i in 1:24]);

println(" quitting ")

quit()