#!/bin/bash
#PBS -S /bin/bash
#PBS -q consort
#PBS -l nodes=3:ppn=12
#PBS -l walltime=10:00
#PBS -o mpi_test.out
#PBS -e mpi_test.err

date

# Change to directory from which job was submitted
cd $PBS_O_WORKDIR

# loaded all modules required for julia
# in .bash_profile

echo "loaded modules"
module list

echo "here is your PBS_NODEFILE"
cat $PBS_NODEFILE

echo "check library path has gcc/4.8.1/lib64 libraries"
echo $LD_LIBRARY_PATH

echo "calling julia now"
/home/eisuc151/local/bin/julia sge.jl 
