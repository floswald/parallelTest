



# here are the slaves.

## R implementation of recursive Fibonacci sequence
fibR <- function(n) {
    if (n == 0) return(0)
    if (n == 1) return(1)
    return (fibR(n - 1) + fibR(n - 2))
}

# wrapper that serially computes fibR for a list of values
serfun <- function(joblist){
	
	# take time
	t1 <- proc.time()[3]
		
	# take name
	nname <- Sys.info()["nodename"]
	names(nname) <- NULL

	# 40 times over
	for (i in 1:40){
		nums <- lapply(joblist, function(x) fibR(x))
	}

	res <- list(node=nname,time=proc.time()[3]-t1,vals=nums)
}
