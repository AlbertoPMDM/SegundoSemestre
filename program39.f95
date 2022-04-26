module utils
    implicit none
    
contains
    function error(a) result(e)
        implicit none
        real, dimension(2), intent(in) :: a
        real :: e
        
        e = abs(a(1)-a(2))/(a(1))
    end function error

    recursive function newtons_method(arg) result(retval)
        implicit none
        type :: arg
        type :: retval
        
    end function newtons_method
end module utils