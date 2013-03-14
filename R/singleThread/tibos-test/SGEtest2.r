
library(Rmpi)


mylist <- list(y=325,z="hallo",q=array(rnorm(5),dim=c(5,1)))
myfun <- function(x){
    print(x)
    print(mylist)
    mpi.remote.exec(paste("I am",mpi.comm.rank(),"of",mpi.comm.size()))}

# environment creator on slaves
create.env <- function(x){
    local.env <- new.env(parent=.GlobalEnv)
    assign("x",x,envir=local.env)
}

mpi.remote.exec(paste("I am",mpi.comm.rank(),"of",mpi.comm.size()))
mpi.remote.exec(paste("I am",Sys.info()1,"of",mpi.comm.size()))

mpi.bcast.Robj2slave(mylist)
mpi.bcast.Robj2slave(myfun)
mpi.bcast.Robj2slave(create.env)
mpi.bcast.cmd(slave.env <- create.env(mylist))
mpi.bcast.cmd(environment(myfun) <- slave.env)

result <- mpi.remote.exec(myfun("local"))

mpi.close.Rslaves()
mpi.quit(save="no")


