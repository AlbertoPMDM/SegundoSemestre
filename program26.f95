! Alberto Mendez 20220313

!funciones (11 ma. en teams)

program program26
    implicit none

    real :: f, s, r_f

    print *, 'ingrese un valor s para f(s)'
    read *, s
    r_f = f(s)

    print *, 'f(s) =', r_f
    
end program program26

function f(s) result(r_f)
    implicit none
    real :: s
    real :: r_f

    if ( s>0 ) then
        r_f = (s**3) + (3*(s**2)) - 2
    else if ( s==0 ) then
        r_f = 2
    else if ( s<0 ) then
        r_f = (-s**3) + (3*(s**2)) - 2
    else
        print *, 'valor fuera del dominio de f'
    end if
        
end function f