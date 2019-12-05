#The conda package repository has many (though not all) of the common R packages that can be installed with the typical conda syntax:
source activate parallel_r
conda search -f r-gsl
conda install -c r r-gsl

#If there are packages that conda does not provide, you can install them locally from within R using the install.packages function. To install a package (lattice for example) directly, simply run:
module load miniconda
source activate my_r_env
R
install.packages("lattice", repos="http://cran.r-project.org")

#In particular, you will need Rmpi, doMC, and doMPI. The first two can be installed via conda, while the last one must be installed manually.
module load miniconda
conda create --name parallel_r -c conda-forge r-base r-essentials r-doMC r-Rmpi
source activate parallel_r
R
install.packages('doMPI')

#List Installed Packages
source activate parallel_r
conda list

