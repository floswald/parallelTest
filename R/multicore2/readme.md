This compares running multithreaded program using mulitcore vs running with mpirun.

The problem with multicode is that the environment is forked at each call for a parallel apply. It seems much more efficient to keep the subporcess running, using mpirun for instance.

Som here I Create a relatively large environment, then call a function that does some compuation and run it on 2 separate nodes. The idea is to find the extra cost that goes with the multicore package vs using snow with socket or mpi.


