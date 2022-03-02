! Alberto Mendez 20220224

! Hacer un programa que pida al usuario una matriz n por n, y 
! una potencia a la cual elevarla

! Elevar la matriz e imprimir la original y la segunda en un archivo de texto

program program22
    implicit none

    interface
        function elevar_matriz(a, n, exp) result(a_elevada)
        integer, intent(in) :: exp, n
        real, dimension(n,n), intent(in) :: a
        real, dimension(n,n) :: a_elevada
        end function elevar_matriz  
    end interface
    
    integer :: n, exp

    real, dimension(:,:), allocatable :: a, b

    
    print *, "Introduzca n para una matriz nxn"
    read(*,*) n

    print *, "Introduzca el numero al que desea elevar la matriz, mayor a 0"
    read(*,*) exp

    allocate(a(n,n))

    CALL llenar_matriz(n, a)

    open(unit=1, file="test.txt")

    write(1,*) "Matriz Introducida"

    CALL imprimir_matriz(n, a, 1)

    write(1,*)

    write(1,*) "Matriz Elevada a la ", exp

    b = elevar_matriz(a, n, exp)

    CALL imprimir_matriz(n, b, 1)

    close(1)

end program program22

!dado una matriz que llenar y la n de una matriz nxn
!pregunta al usuario que numeros poner en cada una de las posiciones 
!de la matriz
subroutine llenar_matriz(n, matriz_resultante)
    implicit none
    integer, intent(in) :: n
    real, dimension(n,n) :: matriz_resultante

    integer :: i, j

        do i = 1, n
            do j = 1, n
                write(*,("(a20, i2, a2, i2, a12)")) "Introduzca el valor ", i, ", ", j, " de la matriz"
                read(*,*) matriz_resultante(i,j)
            end do
        end do
end subroutine llenar_matriz

!dada una matriz cuadrada, y sus dimensiones como n, imprime cada renglon de la 
!matriz en un renglon por separado, igual se le puede anadir la unidad usar un archivo externo
subroutine imprimir_matriz(n, matriz, unidad)
    implicit none

    integer, intent(in) :: n, unidad
    real, dimension(n,n) :: matriz
    integer :: i, j

    do i = 1, n
        do j = 1, n
            write(unidad,"(f10.2)", advance="no") matriz(i, j)
        end do
        write(unidad,*)
    end do

end subroutine imprimir_matriz

!depende de la funcion multiplicar_matriz()
!dada una matriz cuadrada, las dimensiones de esta, y un numero a que elevarla
!devuelve la matriz correspondiente
function elevar_matriz(a, n, exp) result(a_elevada)
    implicit none

    interface
        function multiplicar_matriz(a, b, n) result(c)
        integer, intent(in) :: n
        real, dimension(:,:), intent(in) :: a,b
        real, dimension(n,n) :: c
        end function multiplicar_matriz
    end interface

    integer, intent(in) :: exp, n
    real, dimension(n,n), intent(in) :: a
    real, dimension(n,n) :: a_elevada

    integer :: i

    a_elevada=a

    do i = 2, exp
        a_elevada = multiplicar_matriz(a_elevada, a, n)
    end do
    
end function elevar_matriz

!Dada una matriz a y una matriz b, y sean estas multiplicables, devuelve
! el resultado del producto punto entre las dos matrices
function multiplicar_matriz(a, b, n) result(c)
    implicit none

    integer, intent(in) :: n

    real, dimension(:,:), intent(in) :: a,b

    real, dimension(n,n) :: c

    integer :: i, j, k

    c=0.0

        do i = 1, n
            do j = 1, n
                do k = 1, n
                    c(i,j) = c(i,j) + ( a(i,k) * b(k,j) )
                end do
            end do
        end do
    
end function multiplicar_matriz