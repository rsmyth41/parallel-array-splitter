
		
    program array_split
    use inmod
    implicit none
	integer :: irs,iflag
    integer*4 timeArray(3)
	include "mpif.h"	
	call mpi_init(ierr)
	call mpi_comm_rank(mpi_comm_world,iam,ierr)
	call mpi_comm_size(mpi_comm_world,nproc,ierr)	
	
	nlimitold=129831       

	allocate(nnldr(nlimitold))

         do I=1,nlimitold
         nnldr(I)=I
         if(iam.eq.0)write(90,*)nnldr(I)
         enddo
	  
	  do irs=129831,1,-1
             call nnldr_split(irs,iflag)
	  enddo	  

         do I=0,nproc-1
          if(iam.eq.I)then
           do J=iaa(iam),ibb(iam)
            write(91+iam,*)nnldr2(J)
           enddo
          endif
         enddo


	  
	  if(allocated(nnldr))deallocate(nnldr)
	  if(allocated(iaa))deallocate(iaa)
	  if(allocated(ibb))deallocate(ibb)
	  if(allocated(nnldr2))deallocate(nnldr2)	  
	
        call mpi_barrier(mpi_comm_world,ierr)
	call mpi_finalize(ierr)	
	end
	
	
!-----------------------------------------------------------------------
!-----------------------------------------------------------------------

        
	
!-----------------------------------------------------------------------
!-----------------------------------------------------------------------
          
!-----------------------------------------------------------------------
!-----------------------------------------------------------------------
          
!-----------------------------------------------------------------------
!-----------------------------------------------------------------------
          

