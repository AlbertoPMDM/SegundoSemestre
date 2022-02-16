! Alberto Mendez 20220209

! haga un programa en fortran que imprima con su respectivo cartel lo siguiente

! -el seno y coseno de cero

! - que asigne el valor de pi a una variable calculando dicho valor con alguna de las funciones intr[insecas, e imprima dicho valor

! - ahora que tiene pi, calcule el seno, coseno, y tangente e impr[imalo

! - p[idale un n[umero al usuario mayor que cero, y encuentre la ra[iz, la exponencial, y el logaritmo natural de dicho n[umero (imprimidos)

program program9
    implicit none

    real :: PI, num
    
    print *, "El seno de cero es "
    print *, SIN(0.0)

    print *, "El coseno de cero es "
    print *, COS(0.0)

    PI = 4 * ATAN(1.0)

    print *, "Si el valor de acrtan(1) = pi/4, entonces una aproximacion a pi puede ser 4arctan(1), que da lo siguiente"
    print *, PI

    print *, "El seno de PI es"
    print *, SIN(PI)

    print *, "El coseno de PI es"
    print *, COS(PI)

    print *, "La tangente de PI es"
    print *, TAN(PI)

    print *, "ingresa un numero mayor que cero"
    read(*,*) num

    print *, "la raiz de ese numero es"
    print *, SQRT(num)

    print *, "la exponencial de ese numero es"
    print *, EXP(num)

    print *, "el logaritmo de ese numero es"
    print *, LOG(num)
    
end program program9