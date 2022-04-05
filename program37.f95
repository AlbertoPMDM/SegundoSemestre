
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
    
end module npy

program program37
    use npy
    implicit none


    integer, parameter :: N = 6
    real, dimension(N):: x, y
    integer :: i

    open(file = 'test2.csv', unit = 10)

    do i=1, N
        read(10, *) x(i), y(i)
    end do

    print *, x
    print *, y

    print *, linReg(x, y)

end program program37