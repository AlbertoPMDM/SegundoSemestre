!Alberto Mendez 20220225

! Write a program to calculate te steady-state temperature distribution throughout
! the plate, making an initial assumption that all interior segments are at a
! temperature of 50c. Remember that all outside segments are fixed at a temperature
! of 20c and segment (3,8) is fixed ata a temperature of 100c. the program should 
! apply eq 8-1 iteratively until the maximum temperature change between
! iterations in any node is less than 0.01 degrees. what will steady-state
! temperature of sement (5,5) be

program program23
    implicit none
    
    integer :: n, i, j

    real, dimension(10,10) :: temps, ptemps, dtemps

    logical :: flag

    n = 10

    temps = 50.0

    ptemps = 0.0

    dtemps = 0.0

    CALL temp_init(temps, n)

    do

        ptemps = temps

        CALL segment_temp(temps, n)

        flag = .true.

        do i = 2, n-1
            do j = 2, n-1

                if (.not.((i==3).and.(j==8))) then

                    dtemps(i,j) = temps(i,j) - ptemps(i,j)

                    if (dtemps(i,j)>0.01) then
                        flag = .false.
                    end if

                end if

            end do
        end do

        if (flag .eqv. .true.) then
            open(unit=1, file="test.txt")
            CALL imprimir_matriz(n, temps, 1)
            close(1)
            exit
        end if

    end do

end program program23

subroutine segment_temp(temps, n)

    implicit none
    real, dimension(n,n) :: temps
    integer, intent(in) :: n

    integer :: i, j

    do i = 2, n-1
        do j = 2, n-1

            if (.not.((i==3).and.(j==8))) then

                temps(i,j) = (0.25)*(temps(i+1,j)+temps(i-1,j)+temps(i,j+1)+temps(i,j-1))

            end if

        end do
    end do

end subroutine segment_temp

subroutine temp_init(temps, n)
implicit none
real, dimension(n,n) :: temps
integer ,intent(in) :: n

integer :: i

do i = 1, n
    temps(1,i) = 20.0
    temps(n, i) = 20.00
end do

do i = 1, n
    temps(i,1) = 20.0
    temps(i, n) = 20.00
end do

temps(3,8) = 100.0
end subroutine temp_init

subroutine imprimir_matriz(n, matriz, unidad)
    implicit none

    integer, intent(in) :: n, unidad
    real, dimension(n,n) :: matriz
    integer :: i, j

    do i = 1, n
        do j = 1, n
            write(unidad,"(f8.2)", advance="no") matriz(i, j)
        end do
        write(unidad,*)
    end do

end subroutine imprimir_matriz