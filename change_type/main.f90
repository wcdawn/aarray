PROGRAM main
use iso_c_binding
IMPLICIT NONE

  REAL, ALLOCATABLE, TARGET, DIMENSION (:) :: a
  INTEGER, PARAMETER :: maxlen=10

  INTEGER, PARAMETER :: ione=1 ! default integer
  REAL, PARAMETER :: rone=1.0  ! default real

  ! start
  WRITE(0,*) 'start main'

  IF (storage_size(ione) /= storage_size(rone)) STOP 'inconsistent REAL and INTEGER'

  allocate (a(maxlen))
  CALL a_write_real(maxlen, a)
  CALL a_print_real(maxlen, a)
  DEALLOCATE (a)

  ALLOCATE (a(maxlen))
  CALL a_write_int(maxlen, c_loc(a))
  CALL a_print_int(maxlen-1, c_loc(a(2)))
  DEALLOCATE (a)

  WRITE(0,*) 'end main'
  ! end

  CONTAINS

    SUBROUTINE a_write_real (length, a)
      IMPLICIT NONE
      integer, intent(in) :: length
      REAL, INTENT(out) :: a(length)
      INTEGER :: i
      DO i = 1,length
        a(i)=i*1.0
      ENDDO
      RETURN
    ENDSUBROUTINE 

    SUBROUTINE a_print_real (length, a)
      IMPLICIT NONE
      integer, intent(in) :: length
      REAL, INTENT(in) :: a(length)
      INTEGER :: i
      DO i = 1,length
        WRITE(0,*) a(i)
      ENDDO
      RETURN
    ENDSUBROUTINE

    ! NOTE: this is an attempt to circumvent void* pointers.
    ! This is dangerous for several reasons:
    !   (a) The underlying types do not agree (not really type-correct).
    !   (b) The memory is modified, but the pointer is marked intent(in). This
    !       is the same behavior as a "void* const" rather than a "const void* const".
    SUBROUTINE a_write_int (length, a_ptr)
      IMPLICIT NONE
      integer, intent(in) :: length
      type(c_ptr), intent(in) :: a_ptr
      integer, pointer :: a(:)
      INTEGER :: i
      call c_f_pointer(a_ptr, a, (/length/))
      DO i = 1,length
        a(i)=i
      ENDDO
      RETURN
    ENDSUBROUTINE 

    SUBROUTINE a_print_int (length, a_ptr)
      IMPLICIT NONE
      integer, intent(in) :: length
      type(c_ptr), intent(in) :: a_ptr
      integer, pointer :: a(:)
      INTEGER :: i
      call c_f_pointer(a_ptr, a, (/length/))
      DO i = 1,length
        WRITE(0,*) a(i)
      ENDDO
      RETURN
    ENDSUBROUTINE 

ENDPROGRAM main
