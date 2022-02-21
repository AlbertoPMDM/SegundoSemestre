! alberto mendez 20220218

! haga un programa en fortran que calcule sin, cos, y tan de los angulos de 0 a
! 180 deg en saltos de 2deg, e imprima los resultados en un archivo tipo tabla de la siguiente 
! manera

! |angulo| sin| cos| tan|


    program program18
        implicit none
        
        real :: deltaTheta, theta

        theta = 0.00

        deltaTheta = 0.034906585

        open(unit = 1, file="test.csv")

        write(1,110) "deg", "sin", "cos", "tan"

        do
            write(1, 111) &
            &theta*57.3, SIN(theta), COS(theta), TAN(theta)

            theta = theta + deltaTheta

            if (theta > 3.14) then
                write(1, 111) &
                &theta*57.3, SIN(theta), COS(theta), TAN(theta)
                exit
            end if

        end do

110 format(a3, 6x, a3, 5x, a3, 5x, a3)
111 format(f5.0, x, f7.3, x, f7.3, x, f7.3)

        close(1)


    end program program18