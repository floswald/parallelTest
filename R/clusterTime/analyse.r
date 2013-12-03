


setwd("~/git/mpitest/R/clusterTime")
library(data.table)
library(ggplot2)


load("timer0307.RData")

nr = length(res)
nf = length(res[[1]])

d[node=="node075",sd(time),by=run]
d[,max(sd(time)),by=list(run,node)]

# number of cores per node
n <- d[,list(ncores=length(unique(run))),by=node]
setkey(n,node)

setkey(d,node)
d <- n[d]

d[,ptime := 100 * (time - mean(time)) / mean(time)]
d[,multiple.four := (ncores%%4==0)]


png("timing.png")
ggplot(d,aes(x=multiple.four,ptime)) + geom_point(aes(color=node),position="jitter") + scale_y_continuous(name="percent deviation from mean run time") + scale_x_discrete(name="occupy a multiple of four on node")
dev.off()
