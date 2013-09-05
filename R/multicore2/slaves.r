## R implementation of recursive Fibonacci sequence

N = 1000
B = matrix(runif(N^2),N,N)

fibR <- function(n) {
    B <<- B + 1
    if (n == 0) return(0)
    if (n == 1) return(1)
    return (fibR(n - 1) + fibR(n - 2))
}