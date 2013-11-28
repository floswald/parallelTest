
# here's the SGE directives
# ------------------------------------------
#$ -q batch.q   # <- the name of the Q you want to submit to
#$ -pe mpich 4    
#$ -S /bin/bash   # <- run the job under bash
#$ -N mpi-c-test # <- name of the job in the qstat output
#$ -o pi.out # direct output stream to here
#$ -e pi.err # <- name of the stderr file.
#$ -wd /data/uctpfos/git/mpitest/Cpp/pi

module load openmpi

cat << EOF >> input
10000
1000
100
0

EOF

echo "calling mpirun now"
mpirun -np 4 -stdin input ./mpi_pi
