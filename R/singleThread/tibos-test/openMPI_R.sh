#!/bin/bash

echo "starting qsub script file"
source ~/.bash_profile
date 

# here's the SGE directives
# ------------------------------------------
#$ -q all.q   # <- the name of the Q you want to submit to
#$ -pe mpich 6  #  <- load the openmpi parallel env w/ 6 slots
#$ -S /bin/bash   # <- run the job under bash
#$ -N MPI-SGE # <- name of the job in the qstat output
#$ -o MPI-SGE.out # <- name of the output file.
#$ -e MPI-SGE.out # <- name of the stderr file.
#$ -cwd

module load openmpi
module load open64
module load r/2.13.1

echo "loaded modules"
module list

echo "calling mpirun now"
mpirun -np 6 /data/uctpfos/R/x86_64-unknown-linux-gnu-library/2.14/snow/RMPISNOW -q < SGEtest.R > SGEtest.Rout

## call via: qsub openMPI_R.sh

