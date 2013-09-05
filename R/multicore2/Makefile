RLIB=`Rscript -e "cat(.libPaths()[[1]])"`

mpi:
	mpirun -np 3  $RLIB/snow/RMPISNOW < master-mpi.r

mcore:
	Rscript -e "source('master-mcore.r')"

serial:
	Rscript -e "source('master-serial.r')"
	 



clean:
	rm -rf *.out ./workers; mkdir workers; git pull; qstat -g c; qsub mcore.sh;
