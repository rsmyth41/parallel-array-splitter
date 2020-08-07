     subroutine world_splitter() 
          use inmod
          include "mpif.h" 

          nslice=nlimitold/nproc
          nslice=MAX(nslice,1)

          if(allocated(iaa))deallocate(iaa)
          if(allocated(ibb))deallocate(ibb)

          allocate(iaa(0:nproc-1))
          allocate(ibb(0:nproc-1))

          iover=mod(nlimitold,nproc)

          do i=0,nproc-1
            iaa(i)=(i*nslice)+1
            ibb(i)=(i+1)*nslice
            ibb(i)=ibb(i)+iover
          end do

          icc=abs(ibb(nproc-1)-iaa(nproc-1))+1

          if(allocated(nnldr2))deallocate(nnldr2)
          allocate(nnldr2(iaa(iam):ibb(iam)))

          nnldr2(iaa(iam):ibb(iam))=nnldr(iaa(iam):ibb(iam))

          return

          end
