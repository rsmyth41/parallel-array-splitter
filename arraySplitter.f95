program array_split

use variableMod
implicit none
integer :: irs, iflag
integer*4 timeArray(3)
include "mpif.h"	
call mpi_init(ierr)
call mpi_comm_rank(mpi_comm_world, iam, ierr)
call mpi_comm_size(mpi_comm_world, nproc, ierr)	

! sample array size - should be input parameter into arraySplitter
nlimitold = 129831    

allocate(nnldr(nlimitold))

! creating sample array - remove if using arraySplitter as subroutine
do i = 1, nlimitold
    nnldr(i) = i
    if(iam.eq.0) write(90, *) nnldr(i)
enddo
    
do irs = 129831, 1, -1
    call nnldr_split(irs, iflag)
enddo	  

do i = 0, nproc - 1
    if(iam.eq.i) then
        do j = iaa(iam), ibb(iam)
            write(91 + iam, *) nnldr2(j)
        enddo
    endif
enddo

if(allocated(nnldr)) deallocate(nnldr)
if(allocated(iaa)) deallocate(iaa)
if(allocated(ibb)) deallocate(ibb)
if(allocated(nnldr2)) deallocate(nnldr2)	  

call mpi_barrier(mpi_comm_world, ierr)
call mpi_finalize(ierr)	

end