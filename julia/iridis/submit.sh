	
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

echo "loaded modules"
module list

# load all modules required for julia
# in .bash_profile
# module unload gcc
# module initadd gcc/4.8.1

echo "here is your PBS_NODEFILE"
cat $PBS_NODEFILE

echo "library path"
echo $LD_LIBRARY_PATH

# Run matmul executable in parallel over number of nodes/processors requested
# by job (2*8 by default in #PBS line above), output messages go to output_file

# mpirun matmul > output_file

# LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/eisuc151/git/julia/usr/lib

echo "calling julia now"
# LD_LIBRARY_PATH=$LD_LIBRARY_PATH /home/eisuc151/local/bin/julia sge.jl 
/home/eisuc151/local/bin/julia sge.jl 
