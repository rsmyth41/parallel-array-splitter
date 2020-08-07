subroutine identity(irs,iflagold,iflag)
          use inmod

          integer :: irs,iflagold,iflag

          iflag=-1
          DO II =0, nproc-1

          if((irs.ge.iaa(ii)).and.(irs.le.ibb(ii))) then
           iflag=ii
             if(iflag.eq.iflagold) then
              iworld=iflagold
              return
             endif
           endif
          end do
          return

          end
	  