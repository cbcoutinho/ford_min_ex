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

  subroutine funWrapper_WiThCaps(myfun, x, y)
    real(wp), intent(in),   dimension(:)  :: x
    real(wp), intent(out),  dimension(:)  :: y
    procedure(fun_interf)                 :: myfun

    ! y = myfun(x)
    y = executeFun(myfun, x)

    return
  end subroutine funWrapper_WiThCaps

  function executeFun(myfun, x) result(y)
    real(wp), intent(in),   dimension(:)  :: x
    real(wp),             dimension(size(x))  :: y
    procedure(fun_interf)                 :: myfun

    y = myfun(x)

  end function executeFun

end module example
