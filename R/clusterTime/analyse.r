


setwd("~/git/mpitest/R/clusterTime")
library(data.table)
library(ggplot2)


load("timer.RData")

nr = length(res)
nf = length(res[[1]])

d[node=="node075",sd(time),by=run]
d[,max(sd(time)),by=list(run,node)]

# number of cores per node
d[,length(unique(run)),by=node]

png("timing.png")
ggplot(d,aes(run,ptime)) + geom_point(aes(color=node,shape=factor(repl))) + scale_y_continuous(name="percent deviation from fastest run") + scale_x_continuous(name="function evaluation number")
dev.off()
