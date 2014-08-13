

# readme for the Cpp mpi tester

## ucl econ

this folder contains examples for UCL legion and UCL econ hpc.

one the UCL Econ hpc, you must load 2 modules before running those examples:

1. `module load openmpi`  (or any other mpi suite)
2. `module load open64`

then do `make build` and `make submit`

I have only tested the hello world script.

## ucl legion

don't touch any module loading - the default modules should run the example.
after changing your project ID and ucl user account in `run.sh`, just do

```bash
cd parallelTest/Cpp/legion/pi
make
qsub run.sh
```