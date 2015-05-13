# This R profile can be used when a cluster does not allow spawning or a job 
# scheduler is required to launch any parallel jobs. Saving this file as 
# .Rprofile in the working directory or root directory. For unix platform, run 
# mpirexec -n [cpu numbers] R --no-save -q 
# For windows platform with mpich2, use mpiexec wrapper and specify a working 
# directory where .Rprofile is inside. 
# Cannot be used as Rprofile.site because it will not work

# Following system libraries are not loaded automatically. So manual loads are 
# needed.


library(utils)
library(stats)
library(datasets)
library(grDevices)
library(graphics)
library(methods)

if (!invisible(library(Rmpi,logical.return = TRUE))){
    warning("Rmpi cannot be loaded")
    q(save = "no")
}

options(error=quote(assign(".mpi.err", FALSE, env = .GlobalEnv)))

