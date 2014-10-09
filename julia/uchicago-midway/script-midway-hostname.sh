#!/bin/sh
#SBATCH --time=1

echo $SLURM_JOB_NODELIST

srun hostname | sort
