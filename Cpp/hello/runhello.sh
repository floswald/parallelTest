
# here's the SGE directives
# ------------------------------------------
#$ -q batch.q   # <- the name of the Q you want to submit to
#$ -pe mpich 4    
#$ -S /bin/bash   # <- run the job under bash
#$ -N mpi-c-test # <- name of the job in the qstat output
#$ -o hello.out # direct output stream to here
#$ -e hello.err # <- name of the stderr file.
#$ -wd /data/uctpfos/git/mpitest/Cpp/hello

module load openmpi

echo "calling mpirun now"
mpirun -np 4 -stdin input ./hello
