

# multicore/MPI test

# benchmarks multicore against single thread.



library(snow)

reps <- 5	# how many repetitions

# define a function that is reasonably costly to compute

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

	# do the work
	nums <- lapply(joblist, function(x) fibR(x))

	res <- list(node=nname,time=proc.time()[3]-t1,vals=nums)
	return(res)
}

# make cluster
mycl <- makeCluster(type='MPI')

num.worker <- length(clusterEvalQ(mycl,Sys.info()))	# num.worker chosen in submit script

# source functions on cluster
clusterEvalQ(mycl,source("slaves.r"))


# here are the jobs to do on each core.
# each core needs to go over integers 1:30 and compute fibR
jobs <- lapply(1:num.worker,function(x) 1:30)	

res <- list()

# do reps replications of that test
for (i in 1:reps){
	res[[i]] <- parLapply(cl,jobs,serfun)
}

save(res,file="timer.RData")


# analyze
d <- data.table(expand.grid(repl=1:nr,run=1:nf),key=c("repl","run"))
for (i in 1:nr) for (r in 1:nf) d[.(i,r),node := as.character(res[[i]][[r]]$node)]
for (i in 1:nr) for (r in 1:nf) d[.(i,r),time := as.numeric(res[[i]][[r]]$time)]


library(ggplot2)
pdf("timing.pdf")
ggplot(d,aes(run,time)) + geom_point(aes(color=node,shape=factor(repl))) + scale_y_continuous(name="seconds") + scale_x_continuous(name="function evaluation number")
dev.off()
print("goodbye")
stopCluster(mycl)
