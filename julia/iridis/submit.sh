
#!/bin/bash
#PBS -S /bin/bash
#PBS -q consort
#PBS -l nodes=2:ppn=12
#PBS -l walltime=04:00
#PBS -o mpi_test.out
#PBS -e mpi_test.err

# Change to directory from which job was submitted
cd $PBS_O_WORKDIR

# load openmpi module so that we find the mpirun command
# module load openmpi

echo "loaded modules"
module list

# load all modules required for julia
module unload gcc
module load gcc/4.8.1

echo "here is your PBS_NODEFILE"
cat $PBS_NODEFILE

echo "loaded modules"
module list

# Run matmul executable in parallel over number of nodes/processors requested
# by job (2*8 by default in #PBS line above), output messages go to output_file

# mpirun matmul > output_file

echo "calling julia now"
/home/eisuc151/local/bin/julia sge.jl 
