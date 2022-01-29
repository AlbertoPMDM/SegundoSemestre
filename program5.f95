!Alberto Méndez 20220119

! programa que declare dos vectores de tres posciciones (v1 y v2) y tres matrices 2x2 que se llamen abc

! Que el v1 sea 5, 10, 15

! que el v2 sea 20,20,20

! que a (1,2),(3,4)

! que b (2,2),(2,2)

! que c (a(1,1)/b(1,1), a(1,2)/b(1,2)), (a(2,1)/ b(2,1), a(2,2)/b(2,2)))

program program5
    implicit none

     integer, dimension(3) :: v1, v2

     real, dimension(2,2) :: a, b, c

     v1(1) = 5
     v1(2) = 10
     v1(3) = 15

     v2(1) = 20
     v2(2) = 20
     v2(3) = 20

     a(1,1) = 1
     a(1,2) = 2
     a(2,1) = 3
     a(2,2) = 4

     b(1,1) = 2
     b(1,2) = 2
     b(2,1) = 2
     b(2,2) = 2

     c(1,1) = a(1,1)/b(1,1)
     c(1,2) = a(1,2)/b(1,2)
     c(2,1) = a(2,1)/b(2,1)
     c(2,2) = a(2,2)/b(2,2)

     print *, "v1 = [", v1(1), ", ", v1(2), ", ", v1(3), "]"

     print *, "v2_2 = ", v2(2)

     print *, "a_(1,1) = ", a(1,1)

     print *, "b_(2,2) = ", b(2,2)

     print *, "c = [ [", c(1,1), ", ", c(1,2), "], [", c(2,1), ", ", c(2,2), "] ]"
end program program5