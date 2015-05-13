library(Rmpi)
library(snow)

# start up cluster
ncore <- mpi.universe.size()
cat("ncore:",ncore,"\n")
cl <- makeMPIcluster(ncore)
# if you want to evaluate a funciton f, it needs to be defined on each slave
f.long<-function(n) {
         xx<-rnorm(n)            
         log(abs(xx))+xx^2
}

system.time(sapply(rep(1E6,ncore),f.long))
system.time(parSapply(cl,rep(1E6,ncore),f.long))

stopCluster(cl)



