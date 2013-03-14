#!/bin/bash

echo "starting qsub script file for multicore test"
source ~/.bash_profile
date


# here's the SGE directives
# ------------------------------------------
#$ -q batch.q   # <- the name of the Q you want to submit to
#$ -pe mpich 21  #  <- load the openmpi parallel env w/ $(arg1) slots
#$ -S /bin/bash   # <- run the job under bash
#$ -N MPI-Mcore # <- name of the job in the qstat output
#$ -M f.oswald@ucl.ac.uk
#$ -m e # notify about end of job
#$ -o out.mcore # <- name of the output file.
#$ -e err.mcore # <- name of the stderr file.
#$ -wd /data/uctpfos/git/bankruptcy/discretized/tests

module load openmpi
module load open64
module load r

echo "loaded modules"
module list

echo "calling mpirun now"
mpirun -np 21 /data/uctpfos/R/x86_64-unknown-linux-gnu-library/2.15/snow/RMPISNOW -q < mcore.r > Rout.mcore

