library(parallel)

# start up cluster
ncore <- 15
cl <- makeCluster(ncore)
# if you want to evaluate a funciton f, it needs to be defined on each slave
f.long<-function(n) {
         xx<-rnorm(n)            
         log(abs(xx))+xx^2
}

system.time(sapply(rep(1E7,ncore),f.long))
system.time(parSapply(cl,rep(1E7,ncore),f.long))

stopCluster(cl)



