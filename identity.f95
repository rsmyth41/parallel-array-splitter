subroutine identity(irs,iflagold,iflag)
use variableMod

integer :: irs, iflagold, iflag

iflag = -1

do i = 0, nproc - 1

if((irs.ge.iaa(i)).and.(irs.le.ibb(i))) then
  iflag=i
    if(iflag.eq.iflagold) then
    iworld=iflagold
    return
    endif
  endif
end do

return

end
	  