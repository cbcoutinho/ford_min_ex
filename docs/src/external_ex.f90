module external_ex
  use iso_fortran_env, only: wp=>real64
  use square, only: squareFun
  implicit none

contains

  subroutine squareWrapperExternal(x, y)
    real(wp), intent(in),   dimension(:)  :: x
    real(wp), intent(out),  dimension(:)  :: y

    y = squareFun(x)

    return
  end subroutine squareWrapperExternal

end module external_ex
