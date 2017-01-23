module external
  use iso_fortran_env, only: wp=>real64
  use square
  implicit none

contains

  subroutine squareWrapperExternal(x, y)
    real(wp), intent(in),   dimension(:)  :: x
    real(wp), intent(out),  dimension(:)  :: y

    y = squareFun(x)

    return
  end subroutine squareWrapperExternal

end module external
