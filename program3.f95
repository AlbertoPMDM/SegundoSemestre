program program3
    implicit none

    character(10) :: nombre

    integer :: matricula

    print *, "ingresa tu nombre"

    read(*,*) nombre

    print *, "ingresa tu matricula"

    read(*, *) matricula

    print *, "tu nombre es ", nombre, " y tu matricula es ", matricula

end program program3