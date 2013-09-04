

mpi:
	mpirun -np 3  /Library/Frameworks/R.framework/Versions/2.15/Resources/library/snow/RMPISNOW < master-mpi.r

mcore:
	Rscript -e "source('master-mcore.r')"

serial:
	Rscript -e "source('master-serial.r')"
	 



clean:
	rm -rf *.out ./workers; mkdir workers; git pull; qstat -g c; qsub mcore.sh;
