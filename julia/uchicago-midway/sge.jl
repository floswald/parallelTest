function parseNodeList(s)
    s = replace(s,"]","")
    ss = split(s,"[")
    r = Dict()
    r[:hostname] = ss[1]

    nodes = Int64[]
    for x in  split(ss[2],",")
        if search(x,'-')>0
          xx = split(x,"-")
          for v in int(xx[1]):int(xx[2])   
            push!(nodes,v)
          end
        else
            push!(nodes,int(x))
        end
    end

    r[:nodes] = nodes[1:end]

    return(r)
end

function bind_uocmidway_procs()
    # filestream = open(ENV["PBS_NODEFILE"])
    home = ENV["HOME"]
    host_list = ENV["SLURM_JOB_NODELIST"]

    nodes = parseNodeList(host_list)
    println(nodes)

    # add processes on master itself
    mast = ENV["HOSTNAME"]

    # get a machine file for other hosts
    machines = [ "$(nodes[:hostname])$i" for i in nodes[:nodes]]
    machines = filter(x -> x!=mast,machines) # remove current machine

    println("processes on other hosts:")
    println(machines)

    println("adding machines to current system")
    addprocs(machines, dir= JULIA_HOME )
    println("done")
end

println("Started julia on legion. binding workers now")

bind_uocmidway_procs()

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
map( n -> sum(svd(rand(n,n))[1]) , [100 for i in 1:20]);
pmap( n -> sum(svd(rand(n,n))[1]) , [100 for i in 1:20]);

println("map time:")
@time map( n -> sum(svd(rand(n,n))[1]) , [100 for i in 1:20]);
println("pmap time:")
@time pmap( n -> sum(svd(rand(n,n))[1]) , [100 for i in 1:20]);

println(" quitting ")

quit()
