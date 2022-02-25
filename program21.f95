!Alberto Mendez 20220223

! haga un programa en fortran que le pida al usuario diez coordenadas en el plano, 
! calcule la distancia al origen (el radio de cada coordenada) utilizando una funcion que 
! haga ese calculo e imprima en un archivo cada coordenada con su radio utilizando utilizando una
! subrutina

    program program21
        implicit none

        integer :: i

        real :: radio

        real, dimension(2) :: p

        real, dimension(2, 10) :: puntos

        real, dimension(10) :: radios

        do i=1, 10, 1

            print *, "ingresa el valor del punto ", i

            read(*,*) p(1), p(2)

            puntos(1, i) = p(1)

            puntos(2, i) = p(2)

            radios(i) = radio(p)

        end do 

        CALL routine(puntos, radios)

    end program program21

! funcion que calcula el radio, este estando definido como la distancia entre el origen y
! un punto en el plano cartesiano
    function radio(p) result(res)
        implicit none
        real, dimension(2), intent(in) :: p
        real :: res

        res = SQRT(p(1)**2+p(2)**2)

    end function radio

    subroutine routine(point, rad)
        implicit none
        real, dimension(2, 10), intent(in) :: point
        real, dimension(10), intent(in) :: rad
        integer :: j

        open(unit=1, file="test.csv")

        write(1,("(a,5x,a,6x,a5)")) "x", "y", "radio"

        do j=1, 10, 1

            write(1, 100) point(1, j), point(2, j), rad(j)

        end do

        close(1)

100 format(f6.2, x, f6.2, x, f6.2)  ! formato para x y radio
    end subroutine routine