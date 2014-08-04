#!/bin/bash -l

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
#$ -P laborhome

# 6. Set the working directory to somewhere in your scratch space.  This is
# a necessary step with the upgraded software stack as compute nodes cannot
# write to $HOME.
#
# NOTE: this directory must exist.
#
# Replace "<your_UCL_id>" with your UCL user ID :)
#$ -wd /home/uctprgu/Scratch/mpitest

# 7. Select parallel environment 
#$ -pe openmpi 8

# 8. Join together output and error
#$ -j y

# 9. load modules
module unload compilers
module load recommended/r
module unload mpi/qlogic/1.2.7/intel
module load mpi/openmpi/1.4.5/gnu.4.6.3

# 11. Run our MPI job.  GERun is a wrapper that launches MPI jobs on Legion
gerun $HOME/R/x86_64-unknown-linux-gnu-library/3.0/snow/RMPISNOW -q < $HOME/git/mpitest/R/legion/exp.r > r.output.$JOB_ID