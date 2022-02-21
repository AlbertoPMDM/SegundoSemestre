! !alberto mendez 20220221

! ! Haga un programa en fortran que le pida al usuario diez coordenadas en el plano
! ! y que calcule el radio (distancia del origen a cada coordenada) utilizando una funcion
! ! que calcule dicha distancia

! imprima en un archivo las coordenadas y el radio respectivo

    program program19
        implicit none

        integer :: i

        real :: r, radio

        real, dimension(2) :: p

        open(unit=1, file="test.csv")

        write(1,("(a,5x,a,6x,a5)")) "x", "y", "radio"

        do i=1, 10, 1

            print *, "ingresa el valor del punto ", i

            read(*,*) p(1), p(2)

            r = radio(p)

            write(1, 100) p(1), p(2), r

        end do

        close(1)

        
100 format(f6.2, x, f6.2, x, f6.2)  ! formato para x y radio  

    end program program19

! funcion que calcula el radio, este estando definido como la distancia entre el origen y
! un punto en el plano cartesiano
function radio(p) result(res)
    implicit none
    real, dimension(2), intent(in) :: p
    real :: res

    res = SQRT(p(1)**2+p(2)**2)

end function radio