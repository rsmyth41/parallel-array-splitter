# parallel-array-splitter

This is a set of functions and subroutines to split a large memory consuming array using parallel methods defined by the MPI standard
and written using a mixture of fortran90 and fortran2008.
It was created to deal with the large arrays created during atomic / ionic collision calculations where a copy of a single large
array was kept on each processing core, which was a large waste of memory, resources, and time. This distributes the load equally 
across N processing cores if needed.

To compile:

    mpif90 arraySplitter.f95 identity.f95 nnldrSplit.f95 worldSplit.f95 variableMod.f95 -o arraySplitter.x

To run on one core / serial:

    mpirun -np 1 ./arraySplitter.x

OR:

    ./arraySplitter.x

To run across N cores / parallel:

    mpirun -np N ./arraySplitter.x

To do: test using the ifort compiler

