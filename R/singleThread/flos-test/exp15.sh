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
#$ -o exp.sge.out # <- name of the output file.
#$ -e exp.sge.out # <- name of the stderr file.
#$ -cwd

module load openmpi
module load r/2.15.2

echo "loaded modules"
module list

echo "calling mpirun now"
mpirun -np 3 /data/uctpfos/R/x86_64-unknown-linux-gnu-library/2.15/snow/RMPISNOW -q < exp.r > exp.Rout


