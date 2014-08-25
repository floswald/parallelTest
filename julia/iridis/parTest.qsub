#!/bin/bash
#PBS -S /bin/bash
#PBS -q consort
#PBS -l nodes={{nnodes}}:ppn={{ppnodes}}
#PBS -l walltime={{hours}}:{{mins}}:00
#PBS -m ea
#PBS -M florian.oswald@gmail.com
#PBS -N {{name}}
#PBS -o {{logout}}
#PBS -e {{logerr}}

date

# Change to directory from which job was submitted
cd $PBS_O_WORKDIR

# loaded all modules required for julia
# in .bash_profile

echo "loaded modules"
module list

echo "here is your PBS_NODEFILE"
cat $PBS_NODEFILE

echo "check library path has gcc/4.8.1/lib64 libraries"
echo $LD_LIBRARY_PATH

echo "calling julia now"
{{exec}} {{run}}