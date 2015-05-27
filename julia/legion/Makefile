.PHONY: julia clean

hosts: clean 
	qsub script.sh

clean:
	cd /home/uctpfos/Scratch/mpitest/
	rm -rf test.* 

julia: hosts
	julia --machinefile $temp -L ../incl.jl sge.jl

	
