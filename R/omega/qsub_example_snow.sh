#!/bin/bash

#PBS -q fas_normal
#PBS -N parallelTest
#PBS -l nodes=2:ppn=8, mem=20gb
#PBS -l walltime=00:10:00
#PBS -m abe -M rg684@yale.edu
##oe: stdout(o) and stderr(e)
#PBS -j oe
##where to put the output
#PBS -o $PBS_JOBID.out

module load Apps/R/3.2.2-generic
module load Libs/GSL/2.3
module load Rpkgs/RMPI/0.6.3

#module load openmpi/gcc/2.0.2
#export OMP_NUM_THREADS=1
###run from directory the job is submitted from
cd $PBS_O_WORKDIR


#mpiexec -n 1 R --no-save -q -f snow_example.R
#mpirun -np 1 ~/R/x86_64-pc-linux-gnu-library/3.2/snow/RMPISNOW -q < exp.r
mpiexec -n 1 ~/R/x86_64-pc-linux-gnu-library/3.2/snow/RMPISNOW -q < exp.r
