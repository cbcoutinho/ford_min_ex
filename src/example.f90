module example
  use iso_fortran_env, only: wp => real64
  implicit none

  interface
    function fun_interf(x) result(y)
      import wp
      real(wp), intent(in), dimension(:)  :: x
      real(wp),             dimension(size(x))  :: y
    end function
  end interface

contains

  function squareFun(x) result(y)
    real(wp), intent(in), dimension(:)  :: x
    real(wp),             dimension(size(x))  :: y

    y = x * x

    return
  end function squareFun

end module example
