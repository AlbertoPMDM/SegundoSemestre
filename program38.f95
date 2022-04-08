module PolinomialBisection
    implicit none
    
    contains
        function error(a) result(e)
            implicit none
            real, dimension(2), intent(in) :: a
            real :: e
            
            e = abs(a(1)-a(2))/(a(1))
        end function error

        function cumsum(a) result(a_sum)
            implicit none
            real, dimension(1:), intent(in) :: a
            real :: a_sum
            integer :: i
            a_sum = 0
            
            do i = 1, SIZE(a)
                a_sum = a_sum + a(i)
            end do
            
        end function cumsum

        function avg(a) result(an_avg)
            implicit none
            real, dimension(:), intent(in) :: a
            real :: an_avg
            
            an_avg = cumsum(a)/SIZE(A)
        end function avg

        function evaluate(cfs, x) result(eval)
            implicit none
            real, dimension(:), intent(in) :: cfs
            real, intent(in) :: x
            real :: eval
            integer :: i

            eval = 0
            
            do i = 1, SIZE(cfs)
                eval = eval + cfs(i)*(x**ABS(i-SIZE(cfs)))
            end do
        end function evaluate

        function p_cond(x0, x1, a) result(l)
            implicit none
            real, dimension(:), intent(in) :: a
            real, intent(in) :: x0, x1
            logical :: l
            
            if (evaluate(a, x0)*evaluate(a, x1) < 0 ) then
                l = .true.
            else
                l = .false.
            end if

        end function p_cond

        function get_next_range(a, r) result(new_r)
            implicit none
            real, dimension(2), intent(in) :: r 
            real, dimension(:), intent(in) :: a
            real, dimension(2) :: new_r
            
            if (p_cond(r(1), avg(r), a)) then
                new_r = [r(1),avg(r)]
            else if (.not.(p_cond(r(1), avg(r),a))) then
                new_r = [avg(r), r(2)]
            end if

        end function get_next_range

        recursive function approximate(a, r, delta) result(new_approx)
            implicit none
            real, dimension(:), intent(in) :: a
            real, dimension(2), intent(in) :: r
            real, intent(in) :: delta
            real :: new_approx

            if (error(r) < delta) then
                new_approx = avg(r)
            else
                new_approx =  approximate(a, get_next_range(a, r),delta)
            end if
            
        end function approximate

        function append(element, array) result(a_array)
            ! UWU
            implicit none
            real, allocatable, dimension(:), intent(in) :: array
            real, intent(in) :: element
            real, allocatable, dimension(:):: a_array
            real, allocatable, dimension(:) :: tmp_array
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
end module PolinomialBisection

program program38
    use PolinomialBisection
    implicit none

    real, allocatable, dimension(:) :: a
    real, dimension(2) :: r
    integer :: g, i
    real :: a_tmp, delta

    print *, 'ingresa el grado del polinomio: '
    read (*,*) g

    do i = 1, g+1
        print *, 'introduce el coeficiente de x^', ABS(i-g-1), ': '
        read (*,*) a_tmp
        a = append(a_tmp, a)
    end do

    print *, 'introduce el limite inferior del rango de aproximacion: '
    read(*,*) r(1)
    print *, 'introduce el limite superior del rango de aproximacion: '
    read(*,*) r(2)

    print *, 'introduce el error maximo permitido para la aproximacion'
    read(*,*) delta

    print *, 'la raiz esta en x='
    print *, approximate(a, r, delta)

end program program38