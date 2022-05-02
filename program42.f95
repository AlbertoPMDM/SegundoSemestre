! ALberto mendez 20222704
! Trapezoid rule

! 3

! • Fecha: miércoles 27 de abril de 2022. • Hora: 04:30pm. • Nombre completo del ponente: M.C. Andrea González Báez. • Para validar tu asistencia AFI en la conferencia " Conceptualizando el bienestar de nuestras mascotas", llena este formulario: https://forms.gle/MmkSgUbTAe1tj5rFA
module utils
    implicit none
    
contains
    function delta(a, b, n) result(dx)
        implicit none
        real*8, intent(in) :: a, b
        integer, intent(in):: n
        real*8 :: dx
        
        dx = (b-a)/n
    end function delta

    function partition(a, b, n) result(tmp_list)
        implicit none
        real*8, intent(in) :: a, b
        integer, intent(in) :: n
        real*8 :: dx
        real*8, dimension(n+1) :: tmp_list
        integer :: i
        
        dx = delta(a, b, n)

        do i = 1, n
            tmp_list(i) = a + (i-1)*dx
        end do
    end function partition

    function evaluate(cfs, x) result(eval)
        implicit none
        real*8, dimension(:), intent(in) :: cfs
        real*8, intent(in) :: x
        real*8 :: eval
        integer :: i

        eval = 0
        
        do i = 1, SIZE(cfs)
            eval = eval + cfs(i)*(x**ABS(i-SIZE(cfs)))
        end do
    end function evaluate

    function poly3_integrate(a, b, n, cfs) result(approx)
        implicit none
        real*8, intent(in) :: a, b
        integer, intent(in) :: n
        real*8, intent(in), dimension(:) :: cfs
        real*8 :: approx, insum
        real*8, allocatable, dimension(:) :: p
        integer :: i, n_new

        n_new = n*3
        insum = evaluate(cfs, a) + evaluate(cfs, b)
        p = partition(a, b, n_new)
        do i = 1, SIZE(p)-2
            if ( mod(i,3)==0 ) then
                insum = insum + 2*evaluate(cfs, p(i+1))
            else
                insum = insum + 3*evaluate(cfs, p(i+1))
            end if
        end do

        approx = (3*delta(a, b, n_new)/8)*insum 
    end function poly3_integrate

    function append(element, array) result(a_array)
        ! UWU
        implicit none
        real*8, allocatable, dimension(:), intent(in) :: array
        real*8, intent(in) :: element
        real*8, allocatable, dimension(:):: a_array
        real*8, allocatable, dimension(:) :: tmp_array
        integer :: i

        if (allocated(array)) then

            a_array = array

            call move_alloc(a_array, tmp_array)

            allocate(a_array(SIZE(array)+1))

            do i=1, size(array)
                a_array(i) = tmp_array(i)
            end do

            a_array(size(a_array)) = element

        else

            allocate(a_array(1))
            a_array(1) = element

        end if
            
        
    end function append
end module utils

program program40
    use utils
    implicit none

    real*8, allocatable, dimension(:) :: cfs
    real*8 :: a, b
    integer :: g, i, n
    real*8 :: a_tmp

    print *, 'ingresa el grado del polinomio: '
    read (*,*) g

    do i = 1, g+1
        print *, 'introduce el coeficiente de x^', ABS(i-g-1), ': '
        read (*,*) a_tmp
        cfs = append(a_tmp, cfs)
    end do

    print *, 'introduce el limite inferior de integracion: '
    read(*,*) a
    print *, 'introduce el limite superior de integracion: '
    read(*,*) b

    print *, 'introduce el numero de particiones (se multiplicara por 3)'
    read(*,*) n

    print *, poly3_integrate(a, b, 1, cfs)

end program program40