#!/bin/bash

echo "starting qsub script file"
source ~/.bash_profile
date 

# here's the SGE directives
# ------------------------------------------
#$ -q batch.q   # <- the name of the Q you want to submit to
#$ -pe mpich 3  #  <- load the openmpi parallel env w/ 6 slots
#$ -S /bin/bash   # <- run the job under bash
#$ -N exp-test # <- name of the job in the qstat output
#$ -o exp.out # <- name of the output file.
#$ -e exp.err # <- name of the stderr file.
#$ -cwd

module load openmpi
module load r/3.0.1

echo "loaded modules"
module list

echo "calling mpirun now"
mpirun -np 3 /data/uctpfos/R/x86_64-unknown-linux-gnu-library/3.0/snow/RMPISNOW -q < exp.r > exp.Rout


