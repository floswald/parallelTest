
# mpitest repo

In this repository I collect a couple of mpi-related tests. There are tests R and pure Cpp. 
I use R and MPI with [R package snow](http://cran.r-project.org/web/packages/snow/index.html).

## clusterTime

In this test I run a standard computational task on a given number of compute nodes, for several 
times. The computation is aimed to be both memory and CPU intensive. The test is inspired by
a [blog post of Dirk Eddelbuettel](http://dirk.eddelbuettel.com/blog/2011/09/08/). I use 
[the worst algorithm in the world](http://bosker.wordpress.com/2011/04/29/the-worst-algorithm-in-the-world/)
to compute the Fibonacci sequence of order 30 for 10 times on each node. The function is defined by `F(0) = 0, F(1) = 1, F(n) = F(n-1) + F(n-2)`. In R:

```r
fibR <- function(n) {
    if (n == 0) return(0)
    if (n == 1) return(1)
    return (fibR(n - 1) + fibR(n - 2))
}
```

This implementation is deliberately inefficient. The recursive nature of the problem will cause an immense amount of function calls. In fact,
if n becomes much bigger than 30, you will experience stack overflow.

### Setup

Every compute node performs the exact identical operations. We would expect the timings to be reasonably close to each other **within a given compute node**. 
Notice that many clusters are combining machines of different type and vintage, so it would be natural to see some time difference across machine types.

### Result

The result of this experiment is [on the accompanying wiki page](https://github.com/floswald/mpitest/wiki/clusterTime-Results).

### Trying to get a specific resource on the cluster

Accordign to [this page](http://www.clusterresources.com/torquedocs21/2.1jobsubmission.shtml#nodeExamples), something like
`qsub -l nodes=4:ppn=2` should get you 2 processors on each of 4 nodes. I tried that out in `R/clusterTime/`, didnt' work. 
run the test with `make request`.


## singleThread

standard SGE tests.

## Multicore

Trial for hybrid MPI + OpenMP programming. Fails in the standard setup, since requires a special *thread-safe* version of MPI. google "hybrid programming" for more.
