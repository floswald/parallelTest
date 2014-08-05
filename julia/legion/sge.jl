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

    println(linearray)

    procs = Dict{ASCIIString,Int}()
    for line in linearray
        line_parts = split(line," ")
        procs[line_parts[1]] = int(line_parts[2])
    end

    println("name of compute nodes and number of workers:")
    println(procs)

    # add processes on master itself
    mast = ENV["HOSTNAME"]

    # find full master's name [ why can i not just do readall(run(`hostname -f`))] ??? very annoying!
    procnames = collect(keys(procs))
    master = ""
    for n in procnames
        if contains(n,mast)
            master = n
            break
        end
    end

    if procs[master] > 1
        addprocs(procs[master]-1)
        println("added $(procs[master]-1) processes on master itself")
    end

    # get a machine file for other hosts
    machines = ASCIIString[]
    for (k,n) in procs
        if k!= master
            for i=1:n
                push!(machines,k)
            end
        end
    end

    println("processes on other hosts:")
    println(machines)

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
map( n -> sum(svd(rand(n,n))[1]) , [300 for i in 1:20]);
pmap( n -> sum(svd(rand(n,n))[1]) , [300 for i in 1:20]);

println("map time:")
@time map( n -> sum(svd(rand(n,n))[1]) , [300 for i in 1:20]);
println("pmap time:")
@time pmap( n -> sum(svd(rand(n,n))[1]) , [300 for i in 1:20]);

println(" quitting ")

quit()
