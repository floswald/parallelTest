

# multicore/MPI test
# want to use MPI across machines and multicore on all 4 nodes of each machine

# benchmarks multicore against single thread.

# here is the master.

library(snow)
library(multicore)

mycl <- makeCluster()
clusterEvalQ(mycl,source("slaves-mcore.r"))

params <- 1:20
parlist <- lapply(1:20,function(i) seq(params[i]*0.1,params[i]*2,length=10))

mcfun <- function(idx,pars){
	m <- length(pars[[idx]])
	mcresult <- mclapply(1:m,function(j) mean(rnorm(n=10^7,mean=pars[[idx]][j],sd=1)),mc.cores=4)
	return(mcresult)
}

fun <- function(idx,pars){
	m <- length(pars[[idx]])
	result <- lapply(1:m,function(j) mean(rnorm(n=10^7,mean=pars[[idx]][j],sd=1)))
	return(result)
}

system.time(mcresult <- parLapply(mycl,1:5,function(i) mcfun(idx=i,pars=parlist)))
system.time(result <- parLapply(mycl,1:5,function(i) fun(idx=i,pars=parlist)))
print(mcresult)
print(result)
print("goodbye")
stopCluster(mycl)
