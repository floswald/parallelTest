#!/bin/bash -login

#PBS -q fas_devel
#PBS -N parallelTest
#PBS -l nodes=2:ppn=8
#PBS -l mem=20gb
#PBS -l walltime=00:10:00
#PBS -m abe -M rg684@yale.edu
##oe: stdout(o) and stderr(e)
#PBS -j oe
##where to put the output
#PBS -o $PBS_JOBID.out
##PBS -o $PBS_JOBNAME.$PBS_JOBID

module load Apps/R/3.2.2-generic
module load Libs/GSL/2.3
module load Rpkgs/RMPI/0.6.3

#module load openmpi/gcc/2.0.2
#export OMP_NUM_THREADS=1
#run from directory the job is submitted from
cd $PBS_O_WORKDIR

#     for example, add on jobid nmber.
cat $PBS_NODEFILE > nodes
# How many cores total do we have?
NO_OF_CORES=`cat $PBS_NODEFILE | egrep -v '^#'\|'^$' | wc -l | awk '{print $1}'`
NODE_LIST=`cat $PBS_NODEFILE `
#
# Just for kicks, see which nodes we got.
echo $NODE_LIST
echo $NO_OF_CORES

#mpiexec -n 1 R --no-save -q -f snow_example.R
#mpirun -np 1 ~/R/x86_64-pc-linux-gnu-library/3.2/snow/RMPISNOW -q < exp.r
#mpiexec -n 1 ~/R/x86_64-pc-linux-gnu-library/3.2/snow/RMPISNOW -q < exp.r
#mpiexec -n $NPROCS ~/R/x86_64-pc-linux-gnu-library/3.2/snow/RMPISNOW -q < exp.r
mpirun -np $NO_OF_CORES ~/R/x86_64-pc-linux-gnu-library/3.2/snow/RMPISNOW -q < exp.r
#mpiexec -np $NO_OF_CORES ~/R/x86_64-pc-linux-gnu-library/3.2/snow/RMPISNOW -q < exp.r
#mpirun -np $NO_OF_CORES R --no-save -q < exp.r
#mpirun -np 1 R --no-save -q  < exp.r
