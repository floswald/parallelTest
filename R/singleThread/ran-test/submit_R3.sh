#!/bin/bash

echo "starting qsub script file"
source ~/.bash_profile
date 

# here's the SGE directives
# ------------------------------------------
#$ -q batch.q   # <- the name of the Q you want to submit to
#$ -pe openmpi 20  #  <- load the openmpi parallel env w/ 6 slots
#$ -S /bin/bash   # <- run the job under bash
#$ -N exp-test # <- name of the job in the qstat output
#$ -o exp.out # <- name of the output file.
#$ -j y
#$ -cwd

echo "loaded modules"
module load sge/2011.11
module load openmpi/gcc/64/1.4.5
module load r/3.1.3
module list

echo "LD_LIBRARY_PATH"
echo $LD_LIBRARY_PATH

echo "your hostfile:"
cat $PE_HOSTFILE

echo "calling mpirun now"
mpirun -np 1 R --slave -f exp.r > exp.Rout


