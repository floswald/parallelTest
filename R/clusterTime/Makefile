
standard:
	rm -rf *out *.err *.RData
	git pull
	qstat -g c
	qsub timer.sh

request:
	rm -rf *out *.err *.RData
	git pull
	qstat -g c
	qsub -l nodes=4:ppn=2 timer_request.sh

