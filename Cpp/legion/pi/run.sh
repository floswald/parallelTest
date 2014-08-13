#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=0:10:00
#$ -l mem=1G
#$ -N mpi_pi_8
#$ -pe qlc 8
#$ -P bankruptcy
#$ -e /home/uctpfos/Scratch/legion/mpitest.err
#$ -o /home/uctpfos/Scratch/legion/mpitest.out
#$ -wd /home/uctpfos/git/parallelTest/Cpp/legion/pi

echo "here are my modules:"
module list

echo "note you need a PE that is compatible with the compiler. but they force this on legion anyway."

gerun ./mpi_pi
