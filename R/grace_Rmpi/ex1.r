library("Rmpi")

n<-mpi.comm.size(0)
me<-mpi.comm.rank(0)

mpi.barrier(0)
val<-777
mpi.bcast(val, 1, 0, 0)
print(paste("me", me, "val", val))
mpi.barrier(0)

mpi.quit()
