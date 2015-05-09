
install.packages("Rmpi",contrib.url("http://cran.us.r-project.org"),
											 "configure.args=c("--with-Rmpi-include=/cm/shared/apps/openmpi/gcc/64/1.4.5/include",
                                         "--with-Rmpi-libpath=/cm/shared/apps/openmpi/gcc/64/1.4.5/lib64",
                                         "--with-Rmpi-type=OPENMPI"))
