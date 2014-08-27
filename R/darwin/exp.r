


# R script. export data from master, execute a function collect results
# load master libraries

require(snow)

print(date())


# start up cluster
mycl <- makeCluster(type='MPI')

.Last <- function(){
	print("goodbye.")
	stopCluster(mycl)
}

print(clusterCall(mycl, function() Sys.info()))
print(length(clusterEvalQ(mycl, Sys.info())))
#clusterExport(mycl,"c")


print(clusterCall(mycl, function() {solve(array(runif(1000^2),dim=c(1000,1000)));5}))

arg <- list(a=1:10,b=exp(-3:3))
parLapply(mycl,arg,quantile)


#flofun <- function(x){x^3+a+b}
#parLapply(mycl,1:5,flofun)

#clusterApplyLB(mycl,1:5,flofun)

# call ls() on each node
# clusterEvalQ(mycl, ls() )

# do a calculation and return
# collected.results <- clusterCall(mycl,myfun,c)

# look at them at master
# print(collected.results)

# get a list of tasks for each cluster
# assignments <- clusterSplit(mycl,tasks)

#parLapply(mycl,assignments,myfun)
#cat('goodbye')
#stopCluster(mycl)



