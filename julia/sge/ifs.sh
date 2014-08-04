#!/bin/bash

echo "starting qsub script file"
source ~/.bashrc
date


# here's the SGE directives
# ------------------------------------------
#$ -pe impi 8  #  <- load the openmpi parallel env w/ $(arg1) slots
#$ -S /bin/bash   # <- run the job under bash
#$ -N mpi-testing # <- name of the job in the qstat output
#$ -o timer.out # direct output stream to here
#$ -e timer.err # <- name of the stderr file.
#$ -wd /home/florian_o/git/mpitest/julia/sge

echo "here are your hosts"

cat $PE_HOSTFILE

echo "calling mpirun now"

# /data/uctpfos/git/julia/julia /data/uctpfos/git/mpitest/julia/sge/sge.jl
