# generate slices for a model on mpi cluster

require(mopt)

# let's take a dummy objective function
MOPT_OBJ_FUNC <- objfc.norm2(c(0,0),ns=2000)

# starting parameters
p <- list(x1=0.5,x2=0.5)
MOPT_OBJ_FUNC(p)

# then we want to setup the mopt
mcf                  = mopt_config(p)
mcf$wd               = getwd()
mcf$params_to_sample = c('x1','x2')
mcf$moments_to_use   = c('m1','m2')
mcf$mode             = 'mpi'
mcf$source_on_nodes  <- 'slices.slaves.r'


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
res <- compute.slices(mcf,ns=30,pad=0.1)
