#!/bin/bash

module purge

echo "starting qsub script file"
source ~/.bash_profile
date 

# here's the SGE directives
# ------------------------------------------
#$ -q batch.q   # <- the name of the Q you want to submit to
#$ -pe openmpi 4  #  <- load the openmpi parallel env w/ 6 slots
#$ -S /bin/bash   # <- run the job under bash
#$ -N exp-test # <- name of the job in the qstat output
#$ -o exp.out # <- name of the output file.
#$ -j y
#$ -cwd

echo "loaded modules"
module load sge/2011.11
#module load gcc/0-test-4.9.0
module load openmpi/gcc/64/1.4.5
#module load mpich/ge/gcc
#module load openmpi/intel
module load r/3.1.3
#module load intel-cluster-runtime
module list

echo "LD_LIBRARY_PATH"
printenv LD_LIBRARY_PATH 

echo "MPI_ROOT"
export MPI_ROOT=/cm/shared/apps/openmpi/gcc/64/1.4.5
printenv MPI_ROOT

echo "calling mpirun now"
mpirun -np 4 R --no-save -q < exp.r > exp.Rout


