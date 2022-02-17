!Alberto Méndez 20220215

! Haga un programa que calcule los 
! nums de la serie de fibonacci hasta un val límite que dé e ususario

program program15
    implicit none
    
    integer :: n, nprev, sum, lim

    print *, "Ingrese un numero entero para limitar la serie de fibonacci"
    read (*,*) lim

    ! cantidades iniciales para que la secuencia comience desde 0
    nprev = 0
    n = 1

    ! alternatiavmente, en vez de poner un break, se puede utilizar la variable de cambio con -1 para salir del ciclo
    
    do 
        sum = nprev + n
        nprev = n
        n = sum
        print *, n

        if (n >= lim) then
            exit
        end if
    end do

end program program15