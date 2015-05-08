
#!/bin/bash

echo "starting qsub script file for fibonacci timer"
source ~/.bash_profile
date


# here's the SGE directives
# ------------------------------------------
#$ -q batch.q   # <- the name of the Q you want to submit to
#$ -pe mpich 8  #  <- load the openmpi parallel env w/ $(arg1) slots
#$ -S /bin/bash   # <- run the job under bash
#$ -N mpi-timing # <- name of the job in the qstat output
#$ -o timer.out # direct output stream to here
#$ -e timer.err # <- name of the stderr file.
#$ -wd /data/uctpfos/git/mpitest/R/clusterTime

module load openmpi
module load open64
module load gcc
module load r

echo "loaded modules"
module list

echo "calling mpirun now"
mpirun -np 8 /data/uctpfos/R/x86_64-unknown-linux-gnu-library/3.1/snow/RMPISNOW -q < timer.r > timer.Rout

