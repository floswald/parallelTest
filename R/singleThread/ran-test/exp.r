library(snow)

# start up cluster
cl <- getMPIcluster()
print(clusterCall(cl, function() Sys.info()))
print(length(clusterEvalQ(cl, Sys.info())))
#clusterExport(cl,"c")



# testing direct evaluation via clusterCall
print(clusterCall(cl, function() {solve(array(runif(1000^2),dim=c(1000,1000)));5}))

# testing parLapply
arg <- list(a=1:10,b=exp(-3:3))
parLapply(cl,arg,quantile)

# testing clusterApplyLB
arg <- lapply(1:20,function(i) rnorm(n=100,mean=i,sd=i))
clusterApplyLB(cl,arg,quantile)

# if you want to evaluate a funciton f, it needs to be defined on each slave


stopCluster(cl)



