program main_struct

type dat
  sequence
  integer(4) :: i
  real(8) :: x
endtype dat

integer, parameter :: imax = 1024

type(dat), allocatable :: a(:)

integer :: i

allocate(a(imax))

do i = 1,imax
  a(i)%i = i
  a(i)%x = (i+0.5d0)**2
enddo

do i = 1,imax
  write(*,'(i0, 1x, f10.2)') a(i)%i, a(i)%x
enddo

deallocate(a)

endprogram main_struct
