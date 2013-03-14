require(snow)

cl <- makeCluster()
print(clusterEvalQ(cl, sinkWorkerOutput("nodes.out")))
print(clusterCall(cl, function() Sys.info()))

length(cl)

resp = clusterCall(cl, function(x=2){x+1}, 5) 
print(resp)

stopCluster(cl)
#mpi.close.Rslaves()
#mpi.quit()
