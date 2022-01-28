!Alberto Méndez

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

     integer :: i, j

     v1(1) = 5
     v1(2) = 10
     v1(3) = 15

     do i = 1, 3
         v2(i) = 20
     end do

     a(1,1) = 1
     a(1,2) = 2
     a(2,1) = 3
     a(2,2) = 4

     do i = 1, 2
         do j = 1, 2
             b(i,j) = 2
         end do
     end do

     do i = 1, 2
         do j = 1, 2
             c(i,j) = a(i,j)/b(i,j)
         end do
     end do

end program program5