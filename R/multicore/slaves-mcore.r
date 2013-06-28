


# multicore/MPI test
# want to use MPI across machines and multicore on all 4 nodes of each machine

# here are the slaves.

library(multicore)
library(mopt)

mcfun <- function(id){
	z <- mean(rnorm(1e7))
	me <- Sys.info()["nodename"]
	x <- list(val=z,msg=paste0("I am ",me," doing job number ",id))
	return(x)
}

parfun <- function(id){
	res <- mclapply(1:2, function(x) mcfun(x))
	return(res)
}
