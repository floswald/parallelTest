# Load the R MPI package if it is not already loaded.
if (!is.loaded("mpi_initialize")) {
    library("Rmpi")
    }

# Spawn 31 slaves (change this number appropriately)
mpi.spawn.Rslaves(nslaves=31)
#
# In case R exits unexpectedly, have it automatically clean up
# resources taken up by Rmpi (slaves, memory, etc...)
.Last <- function(){
       if (is.loaded("mpi_initialize")){
           if (mpi.comm.size(1) > 0){
               print("Please use mpi.close.Rslaves() to close slaves.")
               mpi.close.Rslaves()
           }
           print("Please use mpi.quit() to quit R")
           .Call("mpi_finalize")
       }
}
# Tell all slaves to return a message identifying themselves
mpi.remote.exec(paste("I am",mpi.comm.rank(),"of",mpi.comm.size()))

# Tell all slaves to close down, and exit the program
mpi.close.Rslaves()
mpi.quit()

