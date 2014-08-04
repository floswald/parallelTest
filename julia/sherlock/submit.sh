#!/bin/bash

echo "starting qsub script file"
source ~/.bashrc
date


# here's the SGE directives
# ------------------------------------------
#$ -pe impi 8  #  <- load the impi parallel env 
#$ -S /bin/bash   # <- run the job under bash
#$ -N mpi-testing # <- name of the job in the qstat output
#$ -o timer.out # direct output stream to here
#$ -e timer.err # <- name of the stderr file.
#$ -wd /home/florian_o/git/mpitest/julia/sherlock

echo "here are your hosts"

cat $PE_HOSTFILE

echo "calling julia now"

julia /home/florian_o/git/mpitest/julia/sherlock/sge.jl
