#
#install.packages("Rmpi",configure.args=c("--with-Rmpi-include=/cm/shared/apps/openmpi/gcc/64/1.4.5/include",
#                     "--with-Rmpi-libpath=/cm/shared/apps/openmpi/gcc/64/1.4.5/lib64",
#                     "--with-Rmpi-type=OPENMPI"))
#


#install.packages("Rmpi",configure.args=c("--with-mpi=/cm/shared/apps/openmpi/gcc/64/1.4.5"))

require(Rmpi)
mpi.spawn.Rslaves(nslaves=2)
# Tell all slaves to return a message identifying themselves
mpi.remote.exec(paste(Sys.info()[c("nodename")],"checking in as",mpi.comm.rank(),"of",mpi.comm.size()))

# Tell all slaves to close down, and exit the program
mpi.close.Rslaves()
mpi.quit()
