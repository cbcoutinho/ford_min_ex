program main
  use iso_fortran_env, only: wp=>real64
  use example
  implicit none

  real(wp) :: x(5) = [1., 2., 3., 4., 5.]
  real(wp) :: y(5)

  call funWrapper_WiThCaps(square, x, y)
  print '(1x,5(1x,f6.2))', y

  call funWrapper_WiThCaps(cube, x, y)
  print '(1x,5(1x,f6.2))', y

contains

  function square(x) result(y)
    real(wp), intent(in), dimension(:)  :: x
    real(wp),             dimension(size(x))  :: y

    y = x * x

  end function square

  function cube(x) result(y)
    real(wp), intent(in), dimension(:)  :: x
    real(wp),             dimension(size(x))  :: y

    y = x * x * x

  end function cube

end program main
