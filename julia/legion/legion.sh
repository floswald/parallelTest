#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=0:05:0
#$ -l mem=1G
#$ -N julia-test
#$ -pe openmpi 16
#$ -P bankruptcy
#$ -e /home/uctpfos/Scratch/mpitest/test.err
#$ -o /home/uctpfos/Scratch/mpitest/test.out
#$ -wd /home/uctpfos/git/parallelTest/julia/legion


date


temp = `mktemp`
awk '{ for (i=0; i < $2; ++i) { print $1} }' $PE_HOSTFILE > $temp

echo $temp

echo "launching julia"

# /home/uctpfos/git/julia/julia /home/uctpfos/git/parallelTest/julia/legion/sge.jl
julia --machinefile $temp -L ../incl.jl sge.jl
