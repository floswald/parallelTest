.PHONY: julia clean

hosts: clean 
	qsub script.sh

clean:
	rm -rf test.* hosts

julia: hosts
	julia --machinefile hosts -L ../incl.jl sge.jl

	
