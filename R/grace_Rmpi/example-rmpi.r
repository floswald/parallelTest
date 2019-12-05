# generate slices for a model
require(mopt)
library(ggplot2)

# let's take a dummy objective function
MOPT_OBJ_FUNC <- objfc.norm2(c(0,0),ns=2000)

# starting parameters
p <- list(x1=0.5,x2=0.5)
#MOPT_OBJ_FUNC(p)

# then we want to setup the mopt
mcf                  = mopt_config(p)
mcf$mode             = 'mpi'
mcf$wd               = getwd()
mcf$params_to_sample = c('x1','x2')
mcf$moments_to_use   = c('m1','m2')
mcf$iter             = 30
mcf$algo             = algo.bgp
mcf$objfunc          = MOPT_OBJ_FUNC

# set the parameter bounds
mcf <- mcf + 
  samplep('x1',-1,1) +
  samplep('x2',-1,1)

# adding data moment values
mcf <- mcf + datamoments(c('m1','m2'),
                           c(0,0),
                           c(0.1,0.1))

# finalize the preparation
mcf <- prepare.mopt_config(mcf)

# compute slices and generate plots
res = runMOpt(mcf,FALSE)

ggplot(res,aes(x=p.x1,y=p.x2)) + geom_point() + facet_wrap(~chain) + theme_bw()

print(res)


