!Alberto Méndez 20220128

!encontrar el discriminante de una ecuacion cuadratica

program program7
    implicit none
    
    real :: a, b, c, disc

    print *, "ingrese los coeficientes de una ecuacion cuadratica de &
    &la forma ax2 + bx + c = 0 como a b c"

    read(*, *) a, b, c

    disc = (b**2)-4*a*c

    print *, "el discriminante es ", disc
end program program7