PROGRAM main
use iso_c_binding
IMPLICIT NONE

  REAL, ALLOCATABLE, TARGET, DIMENSION (:) :: base
  REAL, POINTER, dimension (:) :: a
  INTEGER, POINTER, DIMENSION (:) :: a__
  INTEGER, PARAMETER :: maxlen=10

  INTEGER, PARAMETER :: ione=1 ! default integer
  REAL, PARAMETER :: rone=1.0  ! default real

  ! start
  WRITE(0,*) 'start main'

  IF (storage_size(ione) /= storage_size(rone)) STOP 'inconsistent REAL and INTEGER'

  allocate (base(maxlen))
  call c_f_pointer(c_loc(base), a, (/maxlen/))
  call c_f_pointer(c_loc(base), a__, (/maxlen/))
  CALL a_write_real(a)
  CALL a_print_real(a)
  DEALLOCATE (base)
  nullify (a)
  nullify (a__)

  ALLOCATE (base(maxlen))
  call c_f_pointer(c_loc(base), a, (/maxlen/))
  call c_f_pointer(c_loc(base), a__, (/maxlen/))
  CALL a_write_int(a__)
  CALL a_print_int(a__)
  DEALLOCATE (base)
  nullify (a)
  nullify (a__)

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
