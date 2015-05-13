library(parallel)

# start up cluster
cl <- makeCluster(7)
# if you want to evaluate a funciton f, it needs to be defined on each slave
f.long<-function(n) {
         xx<-rnorm(n)            
         log(abs(xx))+xx^2
}

system.time(sapply(rep(5E6,11),f.long))
system.time(parSapply(cl,rep(5E6,11),f.long))

stopCluster(cl)



