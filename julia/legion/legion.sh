#!/bin/bash -l


#$ -S /bin/bash
#$ -l h_rt=0:10:0
#$ -l mem=1G
#$ -N mpitest
#$ -pe openmpi 16
#$ -P bankruptcy
#$ -e mpitest.err
#$ -o mpitest.out
#$ -wd /home/uctpfos/Scratch/mpitest


date

echo $PE_HOSTFILE

module unload compilers
module load compilers/gnu/4.6.3
module load python/2.7.3

echo "launching julia"

/home/uctpfos/git/julia/julia /home/uctpfos/git/mpitest/julia/legion/sge.jl
