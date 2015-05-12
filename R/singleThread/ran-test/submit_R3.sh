#!/bin/bash

echo "starting qsub script file"
source ~/.bash_profile
date 

# here's the SGE directives
# ------------------------------------------
#$ -q batch.q   # <- the name of the Q you want to submit to
#$ -pe mpich 4  #  <- load the openmpi parallel env w/ 6 slots
#$ -S /bin/bash   # <- run the job under bash
#$ -N exp-test # <- name of the job in the qstat output
#$ -o exp.out # <- name of the output file.
#$ -j y
#$ -cwd

echo "loaded modules"
#module load gcc/0-test-4.9.0
#module load openmpi/gcc
module load mpich/ge/gcc
module load r/3.1.3
module list

echo "MPI_ROOT"
#export MPI_ROOT=/cm/shared/apps/openmpi/gcc/64/1.4.5
printenv MPI_ROOT

echo "LD_LIBRARY_PATH"
printenv LD_LIBRARY_PATH 


echo "calling mpirun now"
mpirun -np 4 ~/R/x86_64-unknown-linux-gnu-library/3.1/snow/RMPISNOW --no-save -q < exp.r > exp.Rout


