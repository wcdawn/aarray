program main
IMPLICIT NONE

integer, parameter :: imax = 1024

integer(4), allocatable :: a(:)

integer :: i
real(8) :: x

integer(8) :: tranx
integer(4) :: b1, b2

allocate(a(3*imax))

do i = 1,imax

  a((i-1)*3+1) = i

  x = (i+0.5d0)**2

  tranx = transfer(x, 1_8)
  
  b2 = tranx/2**32
  b1 = tranx-int(b2,8)*2**32-1

  a((i-1)*3+2) = b1
  a((i-1)*3+3) = b2

enddo

do i = 1,imax

  if (a((i-1)*3+1) /= i) then
    write(*,*) 'i=', i, 'a=', a((i-1)*3+1)
    STOP 'integer read error'
  endif

  b1 = a((i-1)*3+2)
  b2 = a((i-1)*3+3)

  tranx = b1 + int(b2,8)*2**32 + 1
  x = transfer(tranx, 1d0)

  write(*,*) i, x

  if (x /= (i+0.5d0)**2) then
    write(*,*) b1, b2, tranx
    write(*,*) i, x, (i+0.5d0)**2
    STOP 'double read error'
  endif

enddo

deallocate(a)

endprogram main
