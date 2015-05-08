

# multicore/MPI test

# benchmarks multicore against single thread.



library(snow)

reps <- 5	# how many repetitions

# make cluster
mycl <- getMPIcluster()

num.worker <- length(clusterEvalQ(mycl,Sys.info()))	# num.worker chosen in submit script

# source functions on cluster
clusterEvalQ(mycl,source("slaves.r"))


# here are the jobs to do on each core.
# each core needs to compute the fibonacci sequence up to 30 ten times over
jobs <- lapply(1:num.worker,function(x) rep(30,10))	

res <- list()

# do reps replications of that test
for (i in 1:reps){
	res[[i]] <- parLapply(mycl,jobs,serfun)
}



# analyze
library(data.table)
d <- data.table(expand.grid(repl=1:reps,run=1:num.worker),key=c("repl","run"))
for (i in 1:reps) for (r in 1:num.worker) d[.(i,r),node := as.character(res[[i]][[r]]$node)]
for (i in 1:reps) for (r in 1:num.worker) d[.(i,r),time := as.numeric(res[[i]][[r]]$time)]


save(res,d,file="timer.RData")

# library(ggplot2)
# pdf("timing.pdf")
# ggplot(d,aes(run,time)) + geom_point(aes(color=node,shape=factor(repl))) + scale_y_continuous(name="seconds") + scale_x_continuous(name="function evaluation number")
# dev.off()
print("goodbye")
stopCluster(mycl)
