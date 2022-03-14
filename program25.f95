! Alberto Mendez 20220313

!funciones (11 ma. en teams)

program program25
    implicit none

    real :: r, x, y, r_r

    print *, 'ingrese valores x y y (en ese orden) para R(x,y)'
    read (*,*) x, y
    r_r = r(x,y)

    print *, 'R(x,y) =', r_r
    
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