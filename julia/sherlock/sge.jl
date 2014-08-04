
function bind_pe_sherlock()
  home = ENV["HOME"]
  node_file_name = ENV["PE_HOSTFILE"]

  # parse the file - extract addresses and number of procs
  # on each
  # filestream = open("pe_file_ex.txt")
  filestream = open(node_file_name)
  seekstart(filestream)
  linearray = readlines(filestream)
  machines = map(linearray) do line
      line_parts = split(line," ")
      mash = line_parts[1]
  end

  println("name of compute nodes")
  println(machines)

  # # repeat for nodes with multiple procs
  # # remove master from the node list
  # master_node = ENV["HOSTNAME"]
  # remove_master = 1
  # machines = ASCIIString[]
  # for pp in procs
  #   # println(pp["name"])
  #   for i=1:int(pp["n"])
  #     if ( !contains(pp["name"],master_node)) | (remove_master==0)
  #       push!(machines,pp["name"])
  #     else
  #       remove_master=0
  #     end
  #   end
  # end

  println("individual processes in machine file:")
  println(machines)

  JH = JULIA_HOME

  println("adding machines to current system")
  sleep(1.0)
  addprocs(machines, dir= JH)
  println("done")
end

println("Started julia")

bind_pe_sherlock()

# here a function that runs your estimation:
# using MOpt, mig
# 

# require some code on all nodes
require("incl.jl")

println("make everybody say hello")

@everywhere sayhello()

println("make everybody do some math")

pmap( i->domath(i), [100 for j in 1:length(workers())] )

println("trying parallel for loop with $(nprocs()) processes")
println("numworkers: $(length(workers()))")
println("workers: $(workers())")
@time map( n -> sum(svd(rand(n,n))[1]) , [800 for i in 1:20]);
@time pmap( n -> sum(svd(rand(n,n))[1]) , [800 for i in 1:20]);

println(" quitting ")

quit()