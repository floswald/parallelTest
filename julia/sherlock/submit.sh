#!/bin/bash 
#$ -S /bin/bash   # <- run the job under bash
#$ -V  
#$ -pe impi_tight 16  
#$ -q main.q
#$ -N mpi-testing # <- name of the job in the qstat output
#$ -o test.out # direct output stream to here
#$ -e test.err # <- name of the stderr file.
#$ -wd /home/florian_o/git/parallelTest/julia/sherlock

echo "here are your hosts"

cat $PE_HOSTFILE

echo "my library path is"
echo $LD_LIBRARY_PATH
echo "calling julia now"


/home/florian_o/local/bin/julia /home/florian_o/git/paralleTest/julia/sherlock/sge.jl

