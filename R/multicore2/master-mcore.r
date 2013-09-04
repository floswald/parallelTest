# multicore/MPI test
# benchmarks multicore against single thread.
# RESULT: no effect of using mclapply instead of lapply on cluster.

library(multicore)
library(rbenchmark)
source('slaves.r')

# first I create a large environment
N = 5000
B = matrix(runif(N^2),N,N)
num.worker = 2

print(benchmark( {
  for (i in 1:10) {
    mclapply(1:num.worker,function(job) fibR(26))
  }
},replications=1))

print("goodbye")
