! Alberto Méndez

! haga un programa en fortran que le pida al usuario los coeficientes de una ecuación cuadrática, calcule el discriminante, 
! e imprima si las soluciones son reales iguales, reales diferentes o complejas , e imprima también las soluciones 

program program10
    implicit none
    
    real :: a, b, c, disc, x1, x2, img

    print *, "ingrese los coeficientes de una ecuacion cuadratica de &
    &la forma ax2 + bx + c = 0 como a b c"

    read(*, *) a, b, c

    disc = (b**2)-4*a*c

    if ( disc==0 ) then
        x1 = -b/(2*a)
        x2 = -b/(2*a)

        print *, "Las dos soluciones son reales iguales"
        print *, "x1:"
        print*, x1
        print *, "x2:"
        print *, x2

    end if

    if ( disc > 0 ) then
        x1 = (-b + SQRT(disc))/(2*a)
        x2 = (-b - SQRT(disc))/(2*a)

        print *, "Las dos soluciones son reales diferentes"
        print *, "x1:"
        print*, x1
        print *, "x2:"
        print *, x2
        
    end if

    if ( disc < 0 ) then
        x1 = -b/(2*a)
        x2 = -b/(2*a)

        img = SQRT(-disc)/(2*a)

        print *, "Las dos soluciones son reales complejas conjugadas"
        print *, "x1:"
        print*, x1, "+", img, "i"
        print *, "x2:"
        print *, x2, "-", img, "i"
        
    end if
end program program10