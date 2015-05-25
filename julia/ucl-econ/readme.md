ucl econ hpc
============

important: permissions on `~/.ssh`:

```bash
[uctpfos@hpc-a ucl-econ]$ ls -la ~/.ssh
total 36
drwx------  2 uctpfos uctpfos  4096 Oct 21  2014 .
drwx------ 17 uctpfos uctpfos  4096 May 25 14:52 ..
-rw-r--r--  1 uctpfos uctpfos  1009 Oct 21  2014 authorized_keys
-rw-------  1 uctpfos uctpfos   668 Oct 10  2014 id_dsa
-rw-r--r--  1 uctpfos uctpfos   603 Oct 10  2014 id_dsa.pub
-rw-r--r--  1 uctpfos uctpfos 12803 Apr 17 22:55 known_hosts
```


build notes:

module load gcc/4.7.0

edit Make.user:

JULIA_CPU_TARGET = core2
OPENBLAS_NO_AVX = 1