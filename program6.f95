!Alberto Mendez 20220128

! Haga un programa en fortran que usando vectores pida 4 puntos al usuario 1punto principal (xp,yp) y otros 3 (x1 ,y1)...etc 
! y encuentre la distancia del punto principal a cada uno de los otros 3, 
! y la pendiente de las rectas que se forman uniendo el punto principal con cada uno de los otros 3. 
! Finalmente escriba los resultados de manera adecuada

program program6
    implicit none
    
    real, dimension(2) :: p1, p2, p3, p4

    print *, "ingrese las coordenadas del primer punto, separadas por un espacio"

    read(*, *) p1(1), p1(2)

    print *, "ingrese las coordenadas del segundo punto, separadas por un espacio"

    read(*, *) p2(1), p2(2)

    print *, "ingrese las coordenadas del tercer punto, separadas por un espacio"

    read(*, *) p3(1), p3(2)

    print *, "ingrese las coordenadas del cuarto punto, separadas por un espacio"

    read(*, *) p4(1), p4(2)


    print *, "la distancia entre el primer punto y el segundo es de "

    print *, sqrt( &
        (p1(1)-p2(1))**2 &
        + (p1(2) - p2(2))**2 &
        )

    print *, "la distancia entre el primer punto y el tercero es de "

    print *, sqrt( &
        (p1(1)-p3(1))**2 &
        + (p1(2) - p3(2))**2 &
        )
    
    print *, "la distancia entre el primer punto y el cuarto es de "

    print *, sqrt( &
        (p1(1)-p4(1))**2 &
        + (p1(2) - p4(2))**2 &
        )
    
    print *, "suponiendo que i = [1,0] y j = [0, 1]"

    print *, "la pendiente entre el primer punto y el segundo es de "

    print *, (p2(2) - p1(2)) & 
        / (p2(1) - p1(1))

    print *, "la pendiente entre el primer punto y el segundo es de "

    print *, (p3(2) - p1(2)) & 
        / (p3(1) - p1(1))

    print *, "la pendiente entre el primer punto y el segundo es de "

    print *, (p4(2) - p1(2)) & 
        / (p4(1) - p1(1))
    
end program program6