# Tell all slaves to return a message identifying themselves
mpi.remote.exec(paste(Sys.info()[c("nodename")],"checking in as",mpi.comm.rank(),"of",mpi.comm.size()))

# Tell all slaves to close down, and exit the program
mpi.close.Rslaves()
mpi.quit()