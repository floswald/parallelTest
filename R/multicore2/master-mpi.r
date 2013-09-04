# multicore/MPI test
# benchmarks multicore against single thread.
# RESULT: no effect of using mclapply instead of lapply on cluster.

library(snow)
library(rbenchmark)

# first I create a large environment
N = 5000
B = matrix(runif(N^2),N,N)

# the mpi version
mycl       <- makeCluster(type='MPI')
num.worker <- length(clusterEvalQ(mycl,Sys.info()))
clusterEvalQ(mycl,source("slaves.r"))

cat("num workers:",num.worker,'\n')

print(benchmark( {
  for (i in 1:10) {
    parLapply(mycl,1:num.worker,function(job) fibR(25))
  }
},replications=1))

stopCluster(mycl)

print("goodbye")
stopCluster(mycl)
