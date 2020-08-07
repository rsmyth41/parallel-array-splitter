subroutine nnldr_split(irs,iflag)

use variableMod
include "mpif.h"
integer :: irs, iflag, iflagold = -1
save iflagold

if(iflagold.eq.-1) call world_splitter()

call identity(irs, iflagold, iflag)

if(iflag.eq.iflagold) return 

if(iam.eq.0) write(0, *) irs, iflagold, iflag

if(allocated(nnldr)) deallocate(nnldr)       

allocate(buffer(iaa(iflag):ibb(iflag)))

if(iam.eq.iflag) then	  
        buffer(iaa(iflag):ibb(iflag)) = nnldr2(iaa(iflag):ibb(iflag)) 	  
endif	
                
call mpi_bcast(buffer, icc, mpi_integer, iflag, mpi_comm_world, ierr)
call mpi_barrier(mpi_comm_world, ierr)
call move_alloc(buffer, nnldr)

iflagold = iflag 

end