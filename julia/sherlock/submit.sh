#!/bin/bash -l


#$ -S /bin/bash   # <- run the job under bash
#$ -pe impi 8  #  <- load the impi parallel env 
#$ -N mpi-testing # <- name of the job in the qstat output
#$ -o timer.out # direct output stream to here
#$ -e timer.err # <- name of the stderr file.
#$ -wd /home/florian_o/git/mpitest/julia/sherlock

echo "here are your hosts"

cat $PE_HOSTFILE

source /home/florian_o/settings.sh

echo "my library path is"
echo $LD_LIBRARY_PATH
echo "calling julia now"


/home/florian_o/local/bin/julia /home/florian_o/git/mpitest/julia/sherlock/sge.jl
