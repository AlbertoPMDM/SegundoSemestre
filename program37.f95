
module npy
    implicit none
    contains
    
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

    function multiply(a,b) result(a_mult)
        implicit none
        real, dimension(1:), intent(in):: a,b
        real, dimension(SIZE(a)) :: a_mult
        integer :: i
        
        do i=1, SIZE(a)
            a_mult(i) = a(i) * b(i)
        end do

    end function multiply

    function linReg(a,b) result(reg)
        implicit none
        real, dimension(1:), intent(in) :: a,b
        real, dimension(2) :: reg
        real :: m, n

        m = ((SIZE(a) * cumsum(multiply(a,b))) - &
        (cumsum(a) * cumsum(b))) / &
        ((SIZE(a) * cumsum(multiply(a,a))) - &
        (cumsum(a))**2)

        n = ((cumsum(b) - m * cumsum(a)) / &
        SIZE(a))

        reg(1) = m
        reg(2) = n
    end function linReg

    function append(element, array) result(a_array)
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
    
end module npy

program program37
    use npy
    implicit none

    real, allocatable, dimension(:):: x, y
    real :: x_tmp, y_tmp
    integer :: io

    open(file = 'test2.csv', unit = 10)

    do
        read(10, fmt = *, IOstat = io) x_tmp, y_tmp
        if (io /= 0) exit
        x = append(x_tmp, x)
        y = append(y_tmp,y)
    end do

    print *, x
    print *, y

    print *, linReg(x, y)

end program program37