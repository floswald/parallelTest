

# multicore/MPI test

# benchmarks multicore against single thread.

# RESULT: no effect of using mclapply instead of lapply on cluster.


library(snow)
library(multicore)
library(mopt)
library(rbenchmark)

mycl <- makeCluster(type='MPI')
num.worker <- length(clusterEvalQ(mycl,Sys.info()))
clusterEvalQ(mycl,source("slaves-mcore.r"))

cat("Worker roll call on",date(),"\n",file=file.path(getwd(),"workers","rollcall.txt"),append=FALSE)
clusterCall(mycl, rollcall, file.path(getwd(),"workers"))

## R implementation of recursive Fibonacci sequence
fibR <- function(n) {
    if (n == 0) return(0)
    if (n == 1) return(1)
    return (fibR(n - 1) + fibR(n - 2))
}

parfun <- function(jobs){
	res <- mclapply(jobs, function(x) fibR(x))
	return(res)
}

serfun <- function(jobs){
	res <- lapply(jobs, function(x) fibR(x))
	return(res)
}

jobs <- 1:30

clfun <- function(cl,job,func) parLapply(cl,1:num.worker,function(j) func(job))

benchmark(mcore = clfun(mycl,jobs,parfun), serial=clfun(mycl,jobs,serfun),replications=1)

print("goodbye")
stopCluster(mycl)
