#!/bin/bash 

# Batch script to run an OpenMP threaded R job on Legion with the upgraded
# software stack under SGE. Using the forech packages foreach(...) %dopar%
# for example. 

# This version works with the modules environment upgraded in Feb 2012.

# R Version 2.15.2

# 1. Force bash as the executing shell.
#$ -S /bin/bash 

# 2. Request ten minutes of wallclock time (format hours:minutes:seconds).
#    Change this to suit your requirements.
#$ -l h_rt=0:10:0

# 3. Request 1 gigabyte of RAM. Change this to suit your requirements.
#$ -l mem=1G

# 4. Set the name of the job. You can change this if you wish.
#$ -N R_jobMC_2

# 5. Select the project that this job will run under.
# Find <your_project_id> by running the command "groups"
#$ -P bankruptcy

# 7. Set the working directory to somewhere in your scratch space.  This is
# a necessary step with the upgraded software stack as compute nodes cannot
# write to $HOME.
#
# NOTE: this directory must exist.
#
# Replace "<your_UCL_id>" with your UCL user ID :)
#$ -wd /home/uctpfos/Scratch/git/mpitest/R/legion

# 6. select messaging option
#$ -M f.oswald@ucl.ac.uk	# send notifications to
#$ -m e # notify about end of job

# 7. Select the OpenMPI parallel environment and 16 processes.
#$ -pe openmpi 10

# 8. set error out files
#$ -o exp.out # <- name of the output file.
#$ -e exp.err # <- name of the stderr file.

# 10. load modules
module unload compilers/intel/11.1/072
module unload mpi/qlogic/1.2.7/intel
module unload mkl/10.2.5/035
module load recommended/r
module load mpi/openmpi/1.4.5/gnu.4.6.3


# 11. Run our MPI job.  GERun is a wrapper that launches MPI jobs on Legion
gerun /home/uctpfos/R/x86_64-unknown-linux-gnu-library/2.15/snow/RMPISNOW -q < exp.r > exp.Rout
