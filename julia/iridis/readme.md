

# Julia Tests on Iridis

## Iridis info

some general info about the iridis HPC system: http://www.cfi.ses.ac.uk/iridis/user-guides/

* Torque managed cluster (Torque is open PBS)
* you request nodes (machines) and processes per node (CPUs)
* you have a hard time limit, after which your job is killed
* the PBS manager does **NOT** continuously update your output and error stream while the job is running. It dumps things into a tmp file and only after the job has finished or failed you will see anything.

## Julia Tests

### Environment Variables

1) make sure your `~/.bashrc` looks exactly like mine. Notice that only `~/.bashrc` gets sourced into a non-interactive session. Things you do in `~/.bash_profile` will not be visible. 
2) in my `~/.bashrc` some things are optional (autojump, colors, GIT_SSL and the aliases): what's crucial are the loaded modules. Those must be the ones loaded when you built `julia`
3) look at `submit.sh`: no additional modules loaded!

### Running the test

`qsub submit.sh` from this folder.

Here is the test output:


```bash
Running PBS prologue script on red0588

End of prologue. Now executing user's job
------------------------------------------------------------------------------

Wed Aug 20 13:47:30 BST 2014
loaded modules
here is your PBS_NODEFILE
red0588
red0588
red0588
red0588
red0588
red0588
red0588
red0588
red0588
red0116
red0116
red0116
red0116
red0116
red0116
red0116
red0116
red0116
red0561
red0561
red0561
red0561
red0561
red0561
red0561
red0561
red0561
check library path has gcc/4.8.1/lib64 libraries
/local/software/rh53/mpc/0.9/gcc/lib:/local/software/rh53/gmp/5.0.2/gcc/lib:/local/software/rh53/mpfr/2.4.2/gcc/lib:/local/software/rh53/gcc/4.8.1/lib:/local/software/rh53/gcc/4.8.1/lib64:/local/software/torque/default/lib
calling julia now
Started julia on iridis
name of compute nodes and number of workers:
["red0116"=>9,"red0561"=>9,"red0588"=>9]
added 8 processes on master itself
processes on worker machines:
ASCIIString["red0116","red0116","red0116","red0116","red0116","red0116","red0116","red0116","red0116","red0561","red0561","red0561","red0561","red0561","red0561","red0561","red0561","red0561"]
adding machines to JULIA_HOME: /home/eisuc151/git/julia/usr/bin
done
make everybody say hello
hi I am worker number 1
	From worker 2:	hi I am worker number 2
	From worker 7:	hi I am worker number 7
	From worker 5:	hi I am worker number 5
	From worker 4:	hi I am worker number 4
	From worker 9:	hi I am worker number 9
	From worker 18:	hi I am worker number 18
	From worker 3:	hi I am worker number 3
	From worker 16:	hi I am worker number 16
	From worker 6:	hi I am worker number 6
	From worker 14:	hi I am worker number 14
	From worker 20:	hi I am worker number 20
	From worker 26:	hi I am worker number 26
	From worker 22:	hi I am worker number 22
	From worker 24:	hi I am worker number 24
	From worker 19:	hi I am worker number 19
	From worker 8:	hi I am worker number 8
	From worker 15:	hi I am worker number 15
	From worker 17:	hi I am worker number 17
	From worker 27:	hi I am worker number 27
	From worker 25:	hi I am worker number 25
	From worker 21:	hi I am worker number 21
	From worker 13:	hi I am worker number 13
	From worker 12:	hi I am worker number 12
	From worker 23:	hi I am worker number 23
	From worker 11:	hi I am worker number 11
	From worker 10:	hi I am worker number 10
make everybody do some math
	From worker 4:	Hi, I am worker number 4 doing some math
	From worker 5:	Hi, I am worker number 5 doing some math
	From worker 2:	Hi, I am worker number 2 doing some math
	From worker 3:	Hi, I am worker number 3 doing some math
	From worker 6:	Hi, I am worker number 6 doing some math
	From worker 7:	Hi, I am worker number 7 doing some math
	From worker 9:	Hi, I am worker number 9 doing some math
	From worker 8:	Hi, I am worker number 8 doing some math
	From worker 25:	Hi, I am worker number 25 doing some math
	From worker 23:	Hi, I am worker number 23 doing some math
	From worker 19:	Hi, I am worker number 19 doing some math
	From worker 26:	Hi, I am worker number 26 doing some math
	From worker 20:	Hi, I am worker number 20 doing some math
	From worker 17:	Hi, I am worker number 17 doing some math
	From worker 11:	Hi, I am worker number 11 doing some math
	From worker 13:	Hi, I am worker number 13 doing some math
	From worker 18:	Hi, I am worker number 18 doing some math
	From worker 15:	Hi, I am worker number 15 doing some math
	From worker 14:	Hi, I am worker number 14 doing some math
	From worker 16:	Hi, I am worker number 16 doing some math
	From worker 12:	Hi, I am worker number 12 doing some math
	From worker 10:	Hi, I am worker number 10 doing some math
	From worker 24:	Hi, I am worker number 24 doing some math
	From worker 21:	Hi, I am worker number 21 doing some math
	From worker 22:	Hi, I am worker number 22 doing some math
	From worker 27:	Hi, I am worker number 27 doing some math
make everybody pass a memory test
	From worker 2:	allocating a 30000 by 10000 matrix 
	From worker 6:	allocating a 30000 by 10000 matrix 
	From worker 7:	allocating a 30000 by 10000 matrix 
	From worker 4:	allocating a 30000 by 10000 matrix 
	From worker 3:	allocating a 30000 by 10000 matrix 
	From worker 5:	allocating a 30000 by 10000 matrix 
	From worker 9:	allocating a 30000 by 10000 matrix 
	From worker 11:	allocating a 30000 by 10000 matrix 
	From worker 8:	allocating a 30000 by 10000 matrix 
	From worker 17:	allocating a 30000 by 10000 matrix 
	From worker 15:	allocating a 30000 by 10000 matrix 
	From worker 14:	allocating a 30000 by 10000 matrix 
	From worker 12:	allocating a 30000 by 10000 matrix 
	From worker 13:	allocating a 30000 by 10000 matrix 
	From worker 16:	allocating a 30000 by 10000 matrix 
	From worker 18:	allocating a 30000 by 10000 matrix 
	From worker 10:	allocating a 30000 by 10000 matrix 
	From worker 19:	allocating a 30000 by 10000 matrix 
	From worker 22:	allocating a 30000 by 10000 matrix 
	From worker 20:	allocating a 30000 by 10000 matrix 
	From worker 21:	allocating a 30000 by 10000 matrix 
	From worker 26:	allocating a 30000 by 10000 matrix 
	From worker 23:	allocating a 30000 by 10000 matrix 
	From worker 25:	allocating a 30000 by 10000 matrix 
	From worker 27:	allocating a 30000 by 10000 matrix 
	From worker 24:	allocating a 30000 by 10000 matrix 
	From worker 4:	my matrix has 2.23 GB
	From worker 9:	my matrix has 2.23 GB
	From worker 2:	my matrix has 2.23 GB
	From worker 3:	my matrix has 2.23 GB
	From worker 8:	my matrix has 2.23 GB
	From worker 5:	my matrix has 2.23 GB
	From worker 23:	my matrix has 2.23 GB
	From worker 25:	my matrix has 2.23 GB
	From worker 19:	my matrix has 2.23 GB
	From worker 7:	my matrix has 2.23 GB
	From worker 6:	my matrix has 2.23 GB
	From worker 10:	my matrix has 2.23 GB
	From worker 16:	my matrix has 2.23 GB
	From worker 26:	my matrix has 2.23 GB
	From worker 17:	my matrix has 2.23 GB
	From worker 11:	my matrix has 2.23 GB
	From worker 14:	my matrix has 2.23 GB
	From worker 21:	my matrix has 2.23 GB
	From worker 13:	my matrix has 2.23 GB
	From worker 18:	my matrix has 2.23 GB
	From worker 20:	my matrix has 2.23 GB
	From worker 27:	my matrix has 2.23 GB
	From worker 22:	my matrix has 2.23 GB
	From worker 12:	my matrix has 2.23 GB
	From worker 24:	my matrix has 2.23 GB
	From worker 15:	my matrix has 2.23 GB
trying parallel for loop with 27 processes
numworkers: 26
workers: [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]
elapsed time: 19.0932 seconds (828757548 bytes allocated, 1.52% gc time)
elapsed time: 1.882705 seconds (464692 bytes allocated)
 quitting 
Error sending a Ctrl-C to julia worker 10 on red0116
Error sending a Ctrl-C to julia worker 12 on red0116
Error sending a Ctrl-C to julia worker 14 on red0116
Error sending a Ctrl-C to julia worker 20 on red0561
Error sending a Ctrl-C to julia worker 16 on red0116
Error sending a Ctrl-C to julia worker 17 on red0116
Error sending a Ctrl-C to julia worker 18 on red0116
Error sending a Ctrl-C to julia worker 19 on red0561
Error sending a Ctrl-C to julia worker 25 on red0561
Error sending a Ctrl-C to julia worker 21 on red0561
Error sending a Ctrl-C to julia worker 22 on red0561
Error sending a Ctrl-C to julia worker 23 on red0561
Error sending a Ctrl-C to julia worker 26 on red0561

-----------------------------------------------------------------------------
Running epilogue script on red0588.

Requested resource limits are neednodes=3:ppn=9,nodes=3:ppn=9,pmem=1840mb,walltime=00:10:00
Used resource limits are cput=00:01:30,mem=114140kb,vmem=435972kb,walltime=00:01:02

Finished Running epilogue script on red0588

-----------------------------------------------------------------------------
```