
sge: clean 
	qsub script.sh

clean:
	rm -rf test.* 

julia: sge
	julia --machinefile hosts.txt -L ../incl.jl sge.jl

	
