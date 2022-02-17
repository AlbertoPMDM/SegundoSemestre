!alberto mendez 20220216

! escriba un programa en fortran que evalue la funcion 
! y=ln(1/(1/x)) para cada valor especificado por el usuario
! mientras le valor sea valido de tal manera que el programa termina 
! cuando entra un valor no valido

program program16
    implicit none
    
    real :: x, f

    print *, "ingresa un numero para sustituir en la funcion"
    read(*,*) x

    do while (x<1)

        if ( x<1 ) then
            f = LOG(1/(1-x))
            print *, "f = LOG(1/(1/x)) para x = ", x
            print *, f
        end if

        print *, "ingresa un numero para sustituir en la funcion"
        read(*,*) x

    end do

    print *, "la funcion esta indefinida para x >= 1"
    
end program program16