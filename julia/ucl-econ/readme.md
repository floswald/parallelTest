ucl econ hpc
============


important: permissions on `~/.ssh`:

```bash
[uctpfos@hpc-a ucl-econ]$ ls -la ~/.ssh
total 36
drwx------  2 uctpfos uctpfos  4096 Feb  4 20:41 .
drwxr-xr-x 19 uctpfos uctpfos  4096 Feb  8 13:35 ..
-rw-r--r--  1 uctpfos uctpfos  2509 Feb  4 20:41 authorized_keys
-rw-------  1 uctpfos uctpfos   668 Oct 10  2014 id_dsa
-rw-r--r--  1 uctpfos uctpfos   603 Oct 10  2014 id_dsa.pub
-rw-r--r--  1 uctpfos uctpfos 36006 Mar  8 21:05 known_hosts
```

### running the test

this works like this:

```bash
cd parallelTest/julia/ucl-econ
make hosts    # submits a job and creates a textfile hosts with machine-ids
              # you have to stick around and wait until that file appears
make julia    # runs the test
```

if everything works, you will get this result. You want to check that workers live on different nodes, try out their memory limit (it will crash if you allocate too much memory), and see if the speedup in computation (bottom two timings) is significant. 

This worked `2016-03-08T22:15:53` using `julia version 0.3.7`.

```julia
Started julia on ucl econ
make everybody say hello
hi I am worker number 1, I live on hpc-a
	From worker 2:	hi I am worker number 2, I live on node025
	From worker 4:	hi I am worker number 4, I live on node025
	From worker 3:	hi I am worker number 3, I live on node025
	From worker 5:	hi I am worker number 5, I live on node025
	From worker 6:	hi I am worker number 6, I live on node062
	From worker 7:	hi I am worker number 7, I live on node062
	From worker 9:	hi I am worker number 9, I live on node062
	From worker 8:	hi I am worker number 8, I live on node062
	From worker 16:	hi I am worker number 16, I live on node034
	From worker 17:	hi I am worker number 17, I live on node034
	From worker 14:	hi I am worker number 14, I live on node034
	From worker 15:	hi I am worker number 15, I live on node034
	From worker 20:	hi I am worker number 20, I live on node036
	From worker 18:	hi I am worker number 18, I live on node036
	From worker 19:	hi I am worker number 19, I live on node036
	From worker 21:	hi I am worker number 21, I live on node036
	From worker 22:	hi I am worker number 22, I live on node049
	From worker 24:	hi I am worker number 24, I live on node049
	From worker 25:	hi I am worker number 25, I live on node049
	From worker 13:	hi I am worker number 13, I live on node048
	From worker 11:	hi I am worker number 11, I live on node048
	From worker 12:	hi I am worker number 12, I live on node048
	From worker 10:	hi I am worker number 10, I live on node048
	From worker 23:	hi I am worker number 23, I live on node049
make everybody do some math
	From worker 3:	Hi, I am worker number 3 doing some math
	From worker 2:	Hi, I am worker number 2 doing some math
	From worker 4:	Hi, I am worker number 4 doing some math
	From worker 6:	Hi, I am worker number 6 doing some math
	From worker 7:	Hi, I am worker number 7 doing some math
	From worker 5:	Hi, I am worker number 5 doing some math
	From worker 10:	Hi, I am worker number 10 doing some math
	From worker 14:	Hi, I am worker number 14 doing some math
	From worker 11:	Hi, I am worker number 11 doing some math
	From worker 15:	Hi, I am worker number 15 doing some math
	From worker 19:	Hi, I am worker number 19 doing some math
	From worker 18:	Hi, I am worker number 18 doing some math
	From worker 22:	Hi, I am worker number 22 doing some math
	From worker 23:	Hi, I am worker number 23 doing some math
	From worker 8:	Hi, I am worker number 8 doing some math
	From worker 9:	Hi, I am worker number 9 doing some math
	From worker 13:	Hi, I am worker number 13 doing some math
	From worker 12:	Hi, I am worker number 12 doing some math
	From worker 16:	Hi, I am worker number 16 doing some math
	From worker 17:	Hi, I am worker number 17 doing some math
	From worker 20:	Hi, I am worker number 20 doing some math
	From worker 21:	Hi, I am worker number 21 doing some math
	From worker 24:	Hi, I am worker number 24 doing some math
	From worker 25:	Hi, I am worker number 25 doing some math
make everybody pass a memory test
	From worker 4:	allocating a 10000 by 10000 matrix 
	From worker 6:	allocating a 10000 by 10000 matrix 
	From worker 7:	allocating a 10000 by 10000 matrix 
	From worker 2:	allocating a 10000 by 10000 matrix 
	From worker 3:	allocating a 10000 by 10000 matrix 
	From worker 5:	allocating a 10000 by 10000 matrix 
	From worker 9:	allocating a 10000 by 10000 matrix 
	From worker 8:	allocating a 10000 by 10000 matrix 
	From worker 10:	allocating a 10000 by 10000 matrix 
	From worker 13:	allocating a 10000 by 10000 matrix 
	From worker 12:	allocating a 10000 by 10000 matrix 
	From worker 11:	allocating a 10000 by 10000 matrix 
	From worker 14:	allocating a 10000 by 10000 matrix 
	From worker 15:	allocating a 10000 by 10000 matrix 
	From worker 17:	allocating a 10000 by 10000 matrix 
	From worker 16:	allocating a 10000 by 10000 matrix 
	From worker 19:	allocating a 10000 by 10000 matrix 
	From worker 18:	allocating a 10000 by 10000 matrix 
	From worker 20:	allocating a 10000 by 10000 matrix 
	From worker 21:	allocating a 10000 by 10000 matrix 
	From worker 22:	allocating a 10000 by 10000 matrix 
	From worker 23:	allocating a 10000 by 10000 matrix 
	From worker 25:	allocating a 10000 by 10000 matrix 
	From worker 24:	allocating a 10000 by 10000 matrix 
	From worker 4:	my matrix has 0.74 GB
	From worker 2:	my matrix has 0.74 GB
	From worker 3:	my matrix has 0.74 GB
	From worker 5:	my matrix has 0.74 GB
	From worker 7:	my matrix has 0.74 GB
	From worker 6:	my matrix has 0.74 GB
	From worker 8:	my matrix has 0.74 GB
	From worker 9:	my matrix has 0.74 GB
	From worker 24:	my matrix has 0.74 GB
	From worker 25:	my matrix has 0.74 GB
	From worker 22:	my matrix has 0.74 GB
	From worker 23:	my matrix has 0.74 GB
	From worker 13:	my matrix has 0.74 GB
	From worker 12:	my matrix has 0.74 GB
	From worker 11:	my matrix has 0.74 GB
	From worker 10:	my matrix has 0.74 GB
	From worker 20:	my matrix has 0.74 GB
	From worker 19:	my matrix has 0.74 GB
	From worker 21:	my matrix has 0.74 GB
	From worker 18:	my matrix has 0.74 GB
	From worker 14:	my matrix has 0.74 GB
	From worker 16:	my matrix has 0.74 GB
	From worker 17:	my matrix has 0.74 GB
	From worker 15:	my matrix has 0.74 GB
	From worker 2:	allocating a 15000 by 10000 matrix 
	From worker 6:	allocating a 15000 by 10000 matrix 
	From worker 4:	allocating a 15000 by 10000 matrix 
	From worker 5:	allocating a 15000 by 10000 matrix 
	From worker 7:	allocating a 15000 by 10000 matrix 
	From worker 9:	allocating a 15000 by 10000 matrix 
	From worker 17:	allocating a 15000 by 10000 matrix 
	From worker 15:	allocating a 15000 by 10000 matrix 
	From worker 18:	allocating a 15000 by 10000 matrix 
	From worker 21:	allocating a 15000 by 10000 matrix 
	From worker 23:	allocating a 15000 by 10000 matrix 
	From worker 22:	allocating a 15000 by 10000 matrix 
	From worker 3:	allocating a 15000 by 10000 matrix 
	From worker 11:	allocating a 15000 by 10000 matrix 
	From worker 12:	allocating a 15000 by 10000 matrix 
	From worker 13:	allocating a 15000 by 10000 matrix 
	From worker 19:	allocating a 15000 by 10000 matrix 
	From worker 25:	allocating a 15000 by 10000 matrix 
	From worker 24:	allocating a 15000 by 10000 matrix 
	From worker 8:	allocating a 15000 by 10000 matrix 
	From worker 20:	allocating a 15000 by 10000 matrix 
	From worker 14:	allocating a 15000 by 10000 matrix 
	From worker 10:	allocating a 15000 by 10000 matrix 
	From worker 16:	allocating a 15000 by 10000 matrix 
	From worker 8:	my matrix has 1.12 GB
	From worker 9:	my matrix has 1.12 GB
	From worker 6:	my matrix has 1.12 GB
	From worker 7:	my matrix has 1.12 GB
	From worker 20:	my matrix has 1.12 GB
	From worker 18:	my matrix has 1.12 GB
	From worker 19:	my matrix has 1.12 GB
	From worker 21:	my matrix has 1.12 GB
	From worker 4:	my matrix has 1.12 GB
	From worker 2:	my matrix has 1.12 GB
	From worker 3:	my matrix has 1.12 GB
	From worker 5:	my matrix has 1.12 GB
	From worker 24:	my matrix has 1.12 GB
	From worker 22:	my matrix has 1.12 GB
	From worker 14:	my matrix has 1.12 GB
	From worker 15:	my matrix has 1.12 GB
	From worker 17:	my matrix has 1.12 GB
	From worker 16:	my matrix has 1.12 GB
	From worker 25:	my matrix has 1.12 GB
	From worker 23:	my matrix has 1.12 GB
	From worker 10:	my matrix has 1.12 GB
	From worker 11:	my matrix has 1.12 GB
	From worker 13:	my matrix has 1.12 GB
	From worker 12:	my matrix has 1.12 GB
trying parallel for loop with 25 processes
numworkers: 24
workers: [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
elapsed time: 39.757102034 seconds (1321805364 bytes allocated, 2.23% gc time)
elapsed time: 4.717370187 seconds (466964 bytes allocated)
 quitting 

```