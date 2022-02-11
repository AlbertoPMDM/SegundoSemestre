! Alberto Mendez 20220211

! escriba un programa en fortran que le pida dos valores x, y 
! al usuario y calcule el valor de la funcion f(x,y) definida de la siguiente manera
! x + y ; x >= 0, y >= 0
! x + y**2 ; x >= 0, y < 0
! x**2 + y ; x < 0, y >= 0
! x**2 + y**2 ; x >= 0, y < 0

program program12
    implicit none
    
    real :: f, x, y

    print *, "ingrese valores para x y y como x y"
    read(*,*) x, y

    if ( x>=0 ) then
        if ( y>=0 ) then
            f = x + y
        else
            f = x + y**2
        end if
    else
        if ( y>=0 ) then
            f = x**2 + y
        else
            f = x**2 + y**2
        end if
    end if

    print *, "el resultado para f(x,y) es:"
    print *, f
    
end program program12