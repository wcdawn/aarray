PROGRAM main
IMPLICIT NONE

  REAL, ALLOCATABLE, DIMENSION (:) :: a
  INTEGER, PARAMETER :: maxlen=10

  ! start
  WRITE(0,*) 'start main'

  ALLOCATE (a(maxlen))
  CALL a_write_real(a)
  CALL a_print_real(a)
  DEALLOCATE (a)

  ALLOCATE (a(maxlen))
  CALL a_write_int(a)
  CALL a_print_int(a)
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

    SUBROUTINE a_write_int (a_in)
      IMPLICIT NONE
      REAL, INTENT(out) :: a_in(maxlen)
      INTEGER :: a(maxlen)
      EQUIVALENCE (a_in,a)
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
