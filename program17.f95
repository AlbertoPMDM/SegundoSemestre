
!alberto mendez 20220217

! Haga un programa en fortran que le pida al usuario su nombre, edad, y matricula
! e imprima en un archivo "tu nombre es", nombre ; "tu edad es ", edad;" tu matricula es", matricula

program program17
    implicit none

    character (LEN=50) :: nombre

    character (LEN=50) :: edad

    character (LEN=50) :: matricula

    print *, "ingresa tu nombre"
    read(*,*) nombre

    print *,"ingresa tu matricula"
    read(*,*) matricula

    print *, "ingresa tu edad"
    read(*,*) edad
    
    open(unit=1, file="test.txt")

    write(1,*) "tu nombre es ", nombre
    write(1,*) "tu edad es ", edad
    write(1,*) "tu matricula es ", matricula

    close(1)

end program program17