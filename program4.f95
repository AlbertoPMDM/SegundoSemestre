!Alberto Méndez 20220125
program program4
    implicit none
    
    integer :: a, b, c

    print *, "ingresa dos numeros (a y b)"
    read(*, *) a, b

    c=a+b
    print *, "la suma de a y b es ", c

    print *, "la diferencia entre a y b es ", a-b

    print *, "la multiplicacion de a y b es ", a*b

    print *, "a multiplicado b veces por si misma es ", a ** b
end program program4