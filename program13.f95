!alberto mendez 20220216

! Haga un rpgrama en fortran que pida al ususario un dia de la semana y que imprima "semana de trabajo" 
! en LMMJV, y "fin de semana " en SD, y "dia invalido " para cualquier otro caso 

program program13
    implicit none
    
    character (LEN=10) :: dia

    print *, "escribe el dia de la semana en minusculas y sin acentos"
    read(*,*) dia

    select case (dia)
        case("lunes","martes","miercoles","jueves","viernes")
            print *, "semana de trabajo"
        case("sabado", "domingo")
            print *, "fin de semana"
        case DEFAULT
            print *, "dia invalido"
    end select

end program program13