!alberto mendez 20220216

! haga un programa en fortran que le pida al usuario la temperatura, e impirma lo siguiente

! para t < 0, "es un dia muy frio"
! para t:[0,10], "hoy es un dia frio"
! para t :[11,20], "hoy es un dia  fresco"
! para t:[21, 28], "hoy es un dia agradable"
! para t:[29, 36], "hoy es un dia caliente"
! para t>37, "hoy es un dia muy caliente"

program program14
    implicit none
    
    integer :: temp

    print *, "ingrese la temperatura actual"
    read(*,*) temp

    select case (temp)
        case (:-1)
            print *, "hoy es un dia muy frio"
        case (0:10)
            print *, "hoy es un dia frio"
        case (11:28)
            print *, "hoy es un dia fresco"
        case (29:36)
            print *, "hoy es un dia caliente"
        case (37:)
            print *, "hoy es un dia muy caliente"
    end select

end program program14

