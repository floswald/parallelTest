#!/bin/bash -l

date
module load julia

echo $SLURM_JOB_NODELIST
echo "launching julia"

julia sge.jl
