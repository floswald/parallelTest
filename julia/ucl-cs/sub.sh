#$ -S /bin/bash
#$ -j y
#$ -N juliaMPI_example

#$ -l h_vmem=2G
#$ -l tmem=2G
#$ -l h_rt=

#$ -pe orte 16
#$ -R y

date
hostname

source ~/.bash_profile

export PATH=/share/apps/openmpi-1.8.1/bin:$PATH
export LD_LIBRARY_PATH=/share/apps/openmpi-1.8.1/lib:$LD_LIBRARY_PATH


#Run julia
echo $PE_HOSTFILE

echo ""
echo "calling julia now"

julia --machinefile $PE_HOSTFILE sge.jl

