module utils
    implicit none
    
contains
    function error(a) result(e)
        implicit none
        real*8, dimension(2), intent(in) :: a
        real*8 :: e
        
        e = abs(a(1)-a(2))/(a(1))
    end function error

    function evaluate(cfs, x) result(eval)
        implicit none
        real*8, dimension(:), intent(in) :: cfs
        real*8, intent(in) :: x
        real*8 :: eval
        integer :: i

        eval = 0
        
        do i = 1, SIZE(cfs)
            eval = eval + cfs(i)*(x**ABS(i-SIZE(cfs)))
        end do
    end function evaluate

    function derivative(a, x) result(dx)
        implicit none
        real*8, dimension(:), intent(in) :: a
        real*8, intent(in) :: x
        real*8 :: dx
        real*8 :: h = 0.01
        
        dx = (evaluate(a, x+h)-evaluate(a,x))/h
    end function derivative

    recursive function newtons_method(a, x, delta) result(approx)
        implicit none
        real*8, dimension(:), intent(in) :: a
        real*8, intent(in) :: x, delta
        real*8 :: approx

        if (error([(x - (evaluate(a, x)/derivative(a, x))), x]) < delta) then
            approx = (x - (evaluate(a, x)/derivative(a, x)))
        else
            approx =  newtons_method(a, (x - (evaluate(a, x)/derivative(a, x))), delta)
        end if
        
    end function newtons_method

    function append(element, array) result(a_array)
        ! UWU
        implicit none
        real*8, allocatable, dimension(:), intent(in) :: array
        real*8, intent(in) :: element
        real*8, allocatable, dimension(:):: a_array
        real*8, allocatable, dimension(:) :: tmp_array
        integer :: i

        if (allocated(array)) then

            a_array = array

            call move_alloc(a_array, tmp_array)

            allocate(a_array(SIZE(array)+1))

            do i=1, size(array)
                a_array(i) = tmp_array(i)
            end do

            a_array(size(a_array)) = element

        else

            allocate(a_array(1))
            a_array(1) = element

        end if
            
        
    end function append
end module utils

program program38
    use utils
    implicit none

    real*8, allocatable, dimension(:) :: a
    real*8 :: r
    integer :: g, i
    real*8 :: a_tmp, delta

    print *, 'ingresa el grado del polinomio: '
    read (*,*) g

    do i = 1, g+1
        print *, 'introduce el coeficiente de x^', ABS(i-g-1), ': '
        read (*,*) a_tmp
        a = append(a_tmp, a)
    end do

    print *, 'introduce la primera aproximacion: '
    read(*,*) r

    print *, 'introduce el error maximo permitido para la aproximacion'
    read(*,*) delta

    print *, 'la raiz cerca de la primera aproximación es aproximadamente: '
    print *, newtons_method(a, r, delta)

end program program38