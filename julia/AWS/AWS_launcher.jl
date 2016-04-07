function bind_AWS_procs()

    # find out what cluster we are on
    node_file_name = ENV["PE_HOSTFILE"]

    # read PBS_NODEFILE
    filestream = open(node_file_name)
    seekstart(filestream)
    node_file = readlines(filestream)

    # strip eol
    node_file = map(x->strip(x,['\n']),node_file)

    # get number of workers on each node
    procs = Dict()
    for line in node_file 
        line_parts = split(line," ")
        procs[line_parts[1]] = int(line_parts[2])
    end

    println("name of compute nodes and number of workers:")
    println(procs)

    # add processes on master itself
    master = ENV["HOSTNAME"]

    # if procs[master] > 1
        addprocs(procs[master])
        println("added $(procs[master]) processes on master itself")
    # end

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
        addprocs([m],sshflags=`-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR`,tunnel=true)
    end

    println("done")
end
