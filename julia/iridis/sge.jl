function bind_pe_procs()

    home = ENV["HOME"]
    println(ENV)

     # find out what cluster we are on
    if haskey(ENV,"PBS_SERVER")
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

        # remove master from machine file
        # master cannot ssh into itself!
        master_node = ENV["HOSTNAME"]
        machines = ASCIIString[]

        for i in 1:length(node_file)
            if node_file[i] != master_node
                push!(machines,node_file[i])
            end
        end

    else
      # how to check for SGE?
        node_file_name = ENV["PE_HOSTFILE"]
        filestream = open(node_file_name)
        seekstart(filestream)
        linearray = readlines(filestream)

        println("looking at hostfile:")
        println(linearray)


        # parse the file - extract addresses and number of procs
        # on each
        # filestream = open("pe_file_ex.txt")
        procs = map(linearray) do line
            line_parts = split(line," ")
            proc = {"name" => line_parts[1], "n" => line_parts[2]}
        end

        println("name of compute nodes and number of workers:")
        println(procs)# repeat for nodes with multiple procs

        # remove master from the node list
        master_node = ENV["HOSTNAME"]
        remove_master = 1
        machines = ASCIIString[]
        for pp in procs
            # println(pp["name"])
            for i=1:int(pp["n"])
                if ( !contains(pp["name"],master_node)) | (remove_master==0)
                    push!(machines,pp["name"])
                else
                    remove_master=0
                end
            end
        end
    end

    println("individual processes in machine file:")
    println(machines)

    # add to julia home
    println("adding machines to JULIA_HOME: $JULIA_HOME")

    addprocs(machines, dir= JULIA_HOME)
    println("done")
end

println("Started julia on iridis")

bind_pe_procs()

# here a function that runs your estimation:
# using MOpt, mig

# require some code on all nodes
require("incl.jl")

println("make everybody say hello")

@everywhere sayhello()

println("make everybody do some math")

pmap( i->domath(i), [100 for j in 1:length(workers())] )


# println("trying parallel for loop with $(nprocs()) processes")
# println("numworkers: $(length(workers()))")
# println("workers: $(workers())")
# @time map( n -> sum(svd(rand(n,n))[1]) , [800 for i in 1:20]);
# @time pmap( n -> sum(svd(rand(n,n))[1]) , [800 for i in 1:24]);

println(" quitting ")

quit()