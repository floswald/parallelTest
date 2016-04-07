#!/bin/bash

# here's the SGE directives
# ------------------------------------------
#$ -pe orte 3  #  <- load the openmpi parallel env w/ $(arg1) slots
#$ -N julia-test # <- name of the job in the qstat output
#$ -o test.out # direct output stream to here
#$ -e test.err # <- name of the stderr file.
#$ -wd /data/home/git/parallelTest/julia/AWS

echo "submit script is calling julia now:"

julia sge.jl

