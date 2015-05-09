


# R script. export data from master, execute a function collect results
# load master libraries

require(snow)
# require(RcppSimpleTensor)   

print(date())
# setup some data on master


# start up cluster
mycl <- makeCluster(spec=2, type="MPI")
print(clusterCall(mycl, function() Sys.info()))
print(length(clusterEvalQ(mycl, Sys.info())))
#clusterExport(mycl,"c")



# testing direct evaluation via clusterCall
print(clusterCall(mycl, function() {solve(array(runif(1000^2),dim=c(1000,1000)));5}))

# testing parLapply
arg <- list(a=1:10,b=exp(-3:3))
parLapply(mycl,arg,quantile)

# testing clusterApplyLB
arg <- lapply(1:20,function(i) rnorm(n=100,mean=i,sd=i))
clusterApplyLB(mycl,arg,quantile)

# if you want to evaluate a funciton f, it needs to be defined on each slave


stopCluster(mycl)



