
echo "starting qsub script file"
source ~/.bash_profile
date

module load sge/2011.11
module load julia/0.4.0

# here's the SGE directives
# ------------------------------------------
#$ -q batch.q   # <- the name of the Q you want to submit to
#$ -pe julia 20  #  <- load the julia parallel env w/ $(arg1) slots
#$ -S /bin/bash   # <- run the job under bash
#$ -N JuliaInParallel_Test # <- name of the job in the qstat output
#$ -o timer.out # direct output stream to here
#$ -e timer.err # <- name of the stderr file.
#$ -cwd  		# <- write to current working directory

awk '{ for (i=0; i < $2; ++i) { print $1} }' $PE_HOSTFILE > hosts

echo "calling julia now:"

julia --machinefile hosts -L ../incl.jl sge.jl > results_test.log
