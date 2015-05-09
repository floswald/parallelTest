#!/bin/bash

echo "starting qsub script file"
source ~/.bash_profile
date 

# here's the SGE directives
# ------------------------------------------
#$ -q batch.q   # <- the name of the Q you want to submit to
#$ -pe openmpi 3  #  <- load the openmpi parallel env w/ 6 slots
#$ -S /bin/bash   # <- run the job under bash
#$ -N exp-test # <- name of the job in the qstat output
#$ -o exp.out # <- name of the output file.
#$ -j y
#$ -cwd

module load gcc
module load openmpi/gcc
module load r/3.1.1

echo "loaded modules"
module list

echo "calling mpirun now"
mpirun -np 3 ~/R/x86_64-unknown-linux-gnu-library/3.1/snow/RMPISNOW -q < exp.r > exp.Rout


