#!/bin/bash

#SBATCH -n 4 -N 4 -t 5:00
#SBATCH --mail-type=none

module purge
module load miniconda

source activate parallel_r

mpirun R --slave -f ex1.r
