function bind_pe_procs()
  # filestream = open(ENV["PBS_NODEFILE"])
  home = ENV["HOME"]
  node_file_name = ENV["PE_HOSTFILE"]

  # parse the file - extract addresses and number of procs
  # on each
  # filestream = open("pe_file_ex.txt")
  filestream = open(node_file_name)
  seekstart(filestream)
  linearray = readlines(filestream)
  machines = map(x->strip(x,['\n']),linearray)

  # we only need the name of each worker once?
  machines = unique(machines)

  println("name of compute nodes:")
  println(machines)

  # remove master node
  machines = machines[machines.!=ENV["HOSTNAME"]]

  println("workers in machine file:")
  println(machines)

  println("adding machines to current system")
  addprocs(machines, dir= JULIA_HOME )
  println("done")
end

println("Started julia on legion. binding workers now")

# bind_pe_procs()

# require some code on all nodes
require("incl.jl")

println("make everybody say hello")

@everywhere sayhello()

println("make everybody do some math")

pmap( i->domath(i), [100 for j in 1:length(workers())] )
# here a function that runs your estimation:
# using MOpt, mig
# 

println("trying parallel for loop with $(nprocs()) processes")
println("numworkers: $(length(workers()))")
println("workers: $(workers())")
@time map( n -> sum(svd(rand(n,n))[1]) , [80 for i in 1:20]);
@time pmap( n -> sum(svd(rand(n,n))[1]) , [80 for i in 1:20]);

println(" quitting ")

quit()
