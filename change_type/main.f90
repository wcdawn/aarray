PROGRAM main
use iso_c_binding
IMPLICIT NONE

  REAL, ALLOCATABLE, TARGET, DIMENSION (:) :: a
  INTEGER, POINTER, DIMENSION (:) :: a_
  INTEGER, PARAMETER :: maxlen=10

  ! start
  WRITE(0,*) 'start main'


  ALLOCATE (a(maxlen))
  CALL a_write_real(a)
  CALL a_print_real(a)
  DEALLOCATE (a)

  ALLOCATE (a(maxlen))
  call c_f_pointer ( c_loc(a), a_, (/maxlen/))

  CALL a_write_int(a_)
  CALL a_print_int(a_)
  DEALLOCATE (a)

  WRITE(0,*) 'end main'
  ! end

  CONTAINS

    SUBROUTINE a_write_real (a)
      IMPLICIT NONE
      REAL, INTENT(out) :: a(maxlen)
      INTEGER :: i
      DO i = 1,maxlen
        a(i)=i*1.0
      ENDDO
      RETURN
    ENDSUBROUTINE 

    SUBROUTINE a_print_real (a)
      IMPLICIT NONE
      REAL, INTENT(in) :: a(maxlen)
      INTEGER :: i
      DO i = 1,maxlen
        WRITE(0,*) a(i)
      ENDDO
      RETURN
    ENDSUBROUTINE

    SUBROUTINE a_write_int (a)
      IMPLICIT NONE
      INTEGER, INTENT(out) :: a(maxlen)
      INTEGER :: i
      DO i = 1,maxlen
        a(i)=i
      ENDDO
      RETURN
    ENDSUBROUTINE 

    SUBROUTINE a_print_int (a)
      IMPLICIT NONE
      INTEGER, INTENT(in) :: a(maxlen)
      INTEGER :: i
      DO i = 1,maxlen
        WRITE(0,*) a(i)
      ENDDO
      RETURN
    ENDSUBROUTINE 

ENDPROGRAM main
