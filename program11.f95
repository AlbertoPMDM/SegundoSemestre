!Alberto Méndez 20220211

! escriba un programa en fortran que pida al usuario un valor para una variable t y calcule el valor de la funcion y(t) cuando
! y(t) = -3t**2+5 ; y >= 0
! y(t) = 3t**2+5 : y<0
! e imprimir el resultado

program program11
    implicit none
    
    real :: y, t

    print *, "ingresa el valor de t"
    read(*, *) t

    if ( t >= 0 ) then
        y = -3*t**2+5
    else
        y = 3*t**2+5
    end if

    print *, "el resultado es:"
    print *, y

end program program11