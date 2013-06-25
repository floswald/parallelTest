#!/bin/bash

echo "starting qsub script file"
source ~/.bash_profile
date 

# here's the SGE directives
# ------------------------------------------
#$ -q batch.q   # <- the name of the Q you want to submit to
#$ -pe mpich 3  #  <- load the openmpi parallel env w/ 3 slots
#$ -S /bin/bash   # <- run the job under bash
#$ -N test # <- name of the job in the qstat output
#$ -o test.sge.out # <- name of the output file.
#$ -e test.sge.out # <- name of the stderr file.
#$ -cwd

module load openmpi
module load open64
module load gcc
module load r

echo "loaded modules"
module list

echo "calling mpirun now"
mpirun -np 6 /data/uctpfos/R/x86_64-unknown-linux-gnu-library/2.15/snow/RMPISNOW -q < example-bgp-mpi.r > example-bgp-mpi.Rout

## call via: qsub submit.sh

