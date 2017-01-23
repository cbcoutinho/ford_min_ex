program main
  use iso_fortran_env, only: wp=>real64
  use example, only: fun_interf, &
                    & squareFun
  implicit none

  real(wp) :: x(5) = [1., 2., 3., 4., 5.]
  real(wp) :: y(5)

  ! Call squareFun directly
  y = squareFun(x)
  print '(1x,5(1x,f6.2))', y

  ! Call squareFun using a wrapper that calls squareFun directly
  call squareWrapper(x, y)
  print '(1x,5(1x,f6.2))', y

  ! Send squareFun to a 'general' function wrapper - uses an procedure interface
  call funWrapper(squareFun, x, y)
  print '(1x,5(1x,f6.2))', y

contains

  subroutine funWrapper(myfun, x, y)
    real(wp), intent(in),   dimension(:)  :: x
    real(wp), intent(out),  dimension(:)  :: y
    procedure(fun_interf)                 :: myfun

    ! y = myfun(x)
    y = executeFun(myfun, x)

    return
  end subroutine funWrapper

  function executeFun(myfun, x) result(y)
    real(wp), intent(in),   dimension(:)  :: x
    real(wp),             dimension(size(x))  :: y
    procedure(fun_interf)                 :: myfun

    y = myfun(x)

    return
  end function executeFun

  subroutine squareWrapper(x, y)
    real(wp), intent(in),   dimension(:)  :: x
    real(wp), intent(out),  dimension(:)  :: y

    y = squareFun(x)

    return
  end subroutine squareWrapper

end program main
