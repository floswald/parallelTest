#!/bin/bash

echo "starting qsub script file for fibonacci timer"
source ~/.bash_profile
date


# here's the SGE directives
# ------------------------------------------
#$ -q all.q   # <- the name of the Q you want to submit to
#$ -pe openmpi 20  #  mpich <- load the openmpi parallel env w/ $(arg1) slots
#$ -S /bin/bash   # <- run the job under bash
#$ -N mpi-timing # <- name of the job in the qstat output
#$ -o timer.out # direct output stream to here
#$ -e timer.err # <- name of the stderr file.
#$ -cwd 

#module add openmpi/gcc
module load openmpi
module load open64
module load gcc
module load r/3.1.3

echo "loaded modules"
module list

echo "calling mpirun now"
mpirun -np 20 ~/R/x86_64-unknown-linux-gnu-library/3.1/snow/RMPISNOW < timer.r > timer.Rout

