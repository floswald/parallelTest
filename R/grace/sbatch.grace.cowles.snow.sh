#!/bin/bash
#!
#!#############################################################
#!#### Modify the options in this section as appropriate ######
#!#############################################################

#! sbatch directives begin here ###############################
#! Name of the job:
#SBATCH -J js1

#SBATCH --ntasks=22

#! How much wallclock time will be required?
#SBATCH --time=1:00:00

#! What types of email messages do you wish to receive?
#SBATCH --mail-type=FAIL

#! Do not change:
#SBATCH -p pi_cowles

#! sbatch directives end here (put any additional directives above this line)

#! ############################################################
#! Modify the settings below to specify the application's environment, location
#! and launch method:

#! Optionally modify the environment seen by the application
#! (note that SLURM reproduces the environment at submission irrespective of ~/.bashrc):
module purge                               # Removes all modules still loaded
#module load Apps/R/3.3.2-generic
#module load Libs/GSL/2.3
#module load Rpkgs/RMPI/0.6.3
#module load R/3.5.3-foss-2018a-X11-20180131
#module load GSL/2.3-GCCcore-6.4.0
module load miniconda
source activate parallel_r

#! Insert additional module load commands after this line if needed:

#! Run options for the application:
options="snow.r"

#! Work directory (i.e. where the job will run):
workdir="$SLURM_SUBMIT_DIR"  # The value of SLURM_SUBMIT_DIR sets workdir to the directory
                             # in which sbatch is run.

#! Number of MPI tasks to be started by the application per node and in total (do not change):
np=$SLURM_NTASKS

CMD="mpirun -np 1 R --no-save -q < $options"
#CMD="mpirun -np 1 ~/R/x86_64-pc-linux-gnu-library/3.3/snow/RMPISNOW -q < $options"
#CMD="mpirun -np $np ~/R/x86_64-pc-linux-gnu-library/3.3/snow/RMPISNOW -q < $options"
#CMD="mpirun -np 1 R --slave -f $options"

###############################################################
### You should not have to change anything below this line ####
###############################################################

cd $workdir
echo -e "Changed directory to `pwd`.\n"

JOBID=$SLURM_JOB_ID

echo -e "JobID: $JOBID\n======"
echo "Time: `date`"
echo "Running on master node: `hostname`"
echo "Current directory: `pwd`"

echo -e "\nExecuting command:\n==================\n$CMD\n"


eval $CMD
