
#!/bin/bash
#PBS -S /bin/bash
# Job script to run simple mpi job in parallel on 3 nodes

# set default resource requirements for job (2 processors on 1 node for 1 hours)
# - these can be overridden on the qsub command line
#PBS -l nodes=3:ppn=8
#PBS -l walltime=15:00:00
#PBS -o mpi_test.out
#PBS -e mpi_test.err

#Change to directory from which job was submitted
cd $PBS_O_WORKDIR

# load openmpi module so that we find the mpirun command
# module load openmpi

# load all modules required for julia
module load gcc/4.8.1
module load python

echo "here is your PBS_NODEFILE"
cat $PBS_NODEFILE

# Run matmul executable in parallel over number of nodes/processors requested
# by job (2*8 by default in #PBS line above), output messages go to output_file

# mpirun matmul > output_file

echo "calling julia now"
julia sge.jl 