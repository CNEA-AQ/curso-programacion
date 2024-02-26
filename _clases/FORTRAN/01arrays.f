      program arrays
        implicit none
                integer              :: i,j,k
        	real, dimension(3,3) :: A,B,C
        	real, dimension(3)   :: x,y,z
        	real, dimension(1)   :: s
        
     A =1 ; B = 2 ; C = 3
     x =1 ; y = 2 ; z = 3
     s =1
        
     !Operaciones paralelas con arrays:
     do i=1,3
        do j-1,3
                C(i,j)=A(i,j)+B(i,j)            !serial
        end do
     end do 
     
     C  =  A  + B                               !paralelo
        
        
     !Broadcast 
     C  = s * A + B                             !Los escalares son conformes a cualquier array.
     
     !Dim expansion:
     !          Queremos calcular:  zi = sum_j^n  | xi + xj |
     do i=1, n
        z(i) = 0
        do j=1, n
                z(i) = z(i) + abs(x(i) + x(j))                                  !serial
        end do
     end do
        
     do i=1, n
        w(i) = sum(abs(x(i)+x))                                                 !~parallel
     end do

     A=spread(x,dim=2,ncopies=len(z)) + spread(x, dim=1, ncopies=len(z))        !parallel


     !Mask & Index loss:
     !          Queremos calcular:  zi =  prod_j^n (j/=i) (xj - xi)
     do i=1,n
        z(i) =1
        do j=1,n
                if(j/=i)   z(i) = z(i) * (x(j) - x(i))                          !serial
        end do
     end do

     do i=1,n
        w(i)= product( x-x(i), mask =(x/=x(i)) )                                !parallel SSP
     end do

     A= spread(x,dim=2,ncopies=n) - spread(x,dim=1,ncopies=n)                   !parallel MMP
     z = product(A,dim=1,mask=(a/=0))




     !Linear Recurrence

        !array constructor :  
                a = (/ (i,i=1,b)  /)
           !forma general  aj = b + (j-1)*a


        !Sub-vector scaling:


        !Vector reduction


        !Recursive doubling


        !Cyclic Reduction


        !Second Order Recurrence Relations


        !Tridiagonal Systems




     !Parallel synthetic division:

        !Cumulant of polynomial


        !Syntethic Division by a Monomial

        !Repeated Synt. Div.

        !Poly Coeff. from Roots



     !Fast Fourier Transforms

        !1D FFTs


        !



     !Misc.
        !Scatter-with-Combine Functions


        !Skew Sections


        !SIMD  vs MIMD


     end program 
