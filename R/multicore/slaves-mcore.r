


# multicore/MPI test
# want to use MPI across machines and multicore on all 4 nodes of each machine

# here are the slaves.

library(multicore)
library(mopt)

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
