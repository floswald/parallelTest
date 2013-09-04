## R implementation of recursive Fibonacci sequence
fibR <- function(n) {

    if (n == 0) return(0)
    if (n == 1) return(1)
    return (fibR(n - 1) + fibR(n - 2))
}