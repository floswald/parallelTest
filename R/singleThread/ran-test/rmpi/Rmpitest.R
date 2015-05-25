
#install.packages("Rmpi",configure.args=c("--with-mpi=/cm/shared/apps/openmpi/gcc/64/1.4.5"))

# Tell all slaves to return a message identifying themselves
mpi.remote.exec(paste(Sys.info()[c("nodename")],"checking in as",mpi.comm.rank(),"of",mpi.comm.size()))
mpi.remote.exec(paste(mpi.comm.get.parent()))

x<-5
#These would all be pretty correlated one would think
x<-mpi.remote.exec(rnorm,x) 
length(x)
x

#Use mpi.apply instead to generate a huge increasing list of rnorms (41 in total). 
f.long<-function(n) {
         xx<-rnorm(n)            
         log(abs(xx))+xx^2
}

ncore <- mpi.universe.size()-1
cat("ncore:",ncore,"\n")
system.time(sapply(rep(5E6,ncore),f.long))
system.time(mpi.apply(rep(5E6,ncore),f.long))

# Tell all slaves to close down, and exit the program
mpi.close.Rslaves()
mpi.quit()
