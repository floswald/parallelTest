library(Rmpi)
mpi.spawn.Rslaves(needlog = FALSE)

mpi.bcast.cmd( id <- mpi.comm.rank() )
mpi.bcast.cmd( np <- mpi.comm.size() )
mpi.bcast.cmd( host <- mpi.get.processor.name() )
result <- mpi.remote.exec(paste("I am", id, "of", np, "running on", host)) 

print(unlist(result))

mpi.close.Rslaves(dellog = FALSE)
mpi.exit()

