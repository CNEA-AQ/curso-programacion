      module potencia
        implicit none
        contains

          subroutine potencia(A,v,k)  !A=matriz, v=autovector semilla,autovalor 
            real :: A(:,:)
            real :: v(:)
            real :: k,norma2y
            real    :: y(:)
            real    :: err,minerr=1e-8
            integer :: iter=0,maxiter=100,n

            n=size(v)
            allocate(y(n)); y=0.0

            v=v/norm2(v)

            do while (iter < maxiter  .and. err > minerr)

              y=matmul(A,v)
              k=dot_product(v,y)

              norma2y=norm2(y)
              if (norma2y==0) exit
              x=y/norma2y
              err=x-(y/norma2y)
              iter=iter+1
            end do
          end subroutine

          subroutine potenciaInv(A,v,k)  !A=matriz, v=autovector semilla,autovalor 
          !ESTE TODAVIA HAY QUE PROGRAMARLO:
            real :: A(:,:)
            real :: v(:)
            real :: k,norma2y
            real    :: y(:)
            real    :: err, minerr=1e-8
            integer :: iter=0,maxiter=100,n

            n=size(v)
            allocate(y(n)); y=0.0

            v=v/norm2(v)

            do while (iter < maxiter  .and. err > minerr)

              y=matmul(A,v)
              k=dot_product(v,y)

              norma2y=norm2(y)
              if (norma2y==0) exit
              x=y/norma2y
              err=x-(y/norma2y)
              iter=iter+1
            end do
          end subroutine                                                              end module
