!Alberto mendez

! Hacer un programa que le pida al usuario un numero y que calcule su factorial
! con una funcion
program program20
    implicit none

    real :: num, factorial

    print *, "ingresa un numero de preferencia entero para calcular su factorial"

    read(*,*) num

    write(*, ("(E8.2)")) factorial(num)

end program program20

recursive function factorial(n) result(nfact)
    implicit none
    real, intent(in) :: n
    real :: nfact
    
    if ( n < 1 ) then
        nfact = 1
    else
        nfact = n * factorial(n-1)
    end if
end function factorial