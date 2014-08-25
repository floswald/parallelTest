

# Julia Parallel Computing Tests

Each folder in this section stands for the name of a different hpc computing platform. Each folder is named after the computing platform where the test was run on. They all differ in very small details, but each detail will make your job fail if you don't set it right.

Have a look inside each folder to find out more, in particular to see specific infos about `.bashrc` settings, modules, and test results.

## Tests

if you 

```julia
include("../incl.jl")
```

you can run a series of tests.

### basic communication

each worker prints a message:

```julia
@everywhere sayhello()
```

### some computation on each node with message

each worker does a small computation and prints their name to make sure it's them doing the computation.

```julia
pmap( i->domath(i), [100 for j in 1:length(workers())] )
```

### memory test: allocate a big matrix on each worker

You can use this function to test whether your job is too big for the compute node. If yes, you will get nothing but an error message along the lines of 

```bash
sh: line 1: 26824 Killed ./julia --worker
```

where `26824` is the process id of that specific worker.

you can run this test by calling

```julia
pmap( i->doBIGmath(), 1:length(workers()) )
```

If you should encounter this memory problem, there are various ways. The best solution will be platform specific, so have a look at the subfolders of each platform to see what worked.
