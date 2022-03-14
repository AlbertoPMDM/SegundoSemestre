! Alberto Mendez 20220313

!funciones (11 ma. en teams)

program program25
    implicit none

    real :: r, f, x, y, s, r_f, r_r

    print *, 'ingrese valores x y y (en ese orden) para R(x,y)'
    read (*,*) x, y
    r_r = r(x,y)

    print *, 'ingrese un valor s para f(s)'
    read *, s
    r_f = f(s)

    print *, 'R(x,y) =', r_r

    print *, 'f(s) =', r_f
    
end program program25

function r(x,y) result(r_r)
    implicit none
    real :: x,y
    real :: r_r
    
    if ( (x>=0) .and. (y>=0) ) then
        r_r = ((4/x)*y) + ((x**5)*(y**2))
    else if ( (x<0) .and. (y>0) ) then
        r_r = ((4/x)*-y) + ((x**5)*(y**2))
    else if ( (x>0) .and. (y<0) ) then
        r_r =((4/-x)*y) + ((-x**5)*(y**2))
    else if ( (x<0) .and. (y<0) ) then
        r_r = ((4/x)*y) + ((x**5)*(-y**2))
    else
        print *, 'valor fuera del dominio de R'
    end if
        
end function r

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