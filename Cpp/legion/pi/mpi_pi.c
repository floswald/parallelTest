#include "mpi.h"
#include <math.h>

int main(argc,argv)
     int argc;
     char *argv[];
{
  int done = 0, myid, numprocs, i;
  double PI25DT = 3.141592653589793238462643;
  double mypi, pi, h, sum, x;
  double start_time, finish_time;

  MPI_Init(&argc,&argv);
  MPI_Comm_size(MPI_COMM_WORLD,&numprocs);
  MPI_Comm_rank(MPI_COMM_WORLD,&myid);

  start_time = MPI_Wtime();
      int n = 10000;
      if (myid == 0) {
	//printf("Enter the number of intervals: (0 quits) \n");
	//scanf("%d",&n);
     	printf("The value for n is %d \n",n); 
      }
      MPI_Bcast(&n, 1, MPI_INT, 0, MPI_COMM_WORLD);
  
      h   = 1.0 / (double) n;
      sum = 0.0;
      for (i = myid + 1; i <= n; i += numprocs) {
	x = h * ((double)i - 0.5);
	sum += 4.0 / (1.0 + x*x);
      }
      mypi = h * sum;
    
      MPI_Reduce(&mypi, &pi, 1, MPI_DOUBLE, MPI_SUM, 0,
		 MPI_COMM_WORLD);
    
     finish_time = MPI_Wtime();
   if (myid == 0)
  printf("pi is approximately %.16f, Error is %.16f, %8g seconds taken.\n",
	       pi, fabs(pi - PI25DT), finish_time-start_time);
  MPI_Finalize();
  return 0;
}