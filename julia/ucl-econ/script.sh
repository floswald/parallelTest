#!/bin/bash

echo "starting qsub script file"
source ~/.bash_profile
date

module load sge/2011.11
module load julia/0.3.1

# here's the SGE directives
# ------------------------------------------
#$ -q batch.q   # <- the name of the Q you want to submit to
#$ -pe mpich 20  #  <- load the openmpi parallel env w/ $(arg1) slots
#$ -S /bin/bash   # <- run the job under bash
#$ -N mpi-testing # <- name of the job in the qstat output
#$ -o timer.out # direct output stream to here
#$ -e timer.err # <- name of the stderr file.
#$ -wd /data/uctpfos/git/parallelTest/julia/ucl-econ

echo "calling mpirun now"

julia /data/uctpfos/git/parallelTest/julia/sge.jl