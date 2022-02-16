! Alberto Méndez 20220108

!crear dos matrices del tamaño que el usario desee, que se sumen, y se imprima el resultado de la suma

program program8
    implicit none
    
    integer :: m, n

    real, allocatable, dimension(:, :) :: a1, a2, b

    print*, "Escribir el tamaño de las dos matrices como 'm n'"

    read(*,*) m, n

    allocate(a1(m,n), a2(m,n), b(m, n))

    CALL random_seed()
    
    CALL random_number(a1)

    CALL random_number(a2)

    b = a1 + a2

    print *, b

end program program8