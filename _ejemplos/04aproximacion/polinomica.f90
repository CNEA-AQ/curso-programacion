  module aprox_polinomica

    use sels             !Resolver sist. de ec. lin.
    use fun_ortogonales  !Funciones de aproximación
! Teoría:
! Mínimizar funcional F(X) = integral ( |f(X)-P(X)|**2 )
!                      donde P(x)= sum(Ai*Xi)
! Es decir tengo que encontrar A tal que F se extremice: ( dF/da=0 )
! Teorema: Si phi_i;phi_j son l.i. Existe único c_1,...,c_n t.q 
!  f-sum (phi_i,phi_j ci) = 0
! ECUACIONES NORMALES!
    contains
    function aprox(x,y,n) result (coefs)
      implicit none
        real, intent(in) :: x(:),y(:)
        integer, intent(in) :: n !grado del polinomio aproximante
        real, allocatable :: phi(:,:),b(:),coefs(:)
        integer :: i,j
    
      allocate(coefs(n)); coefs=0 
      allocate(phi(n,n)); phi=0 
      allocate(b(n)); b=0 
      
      
      do i=0,n-1
        do j=0,n-1
        phi(i+1,j+1)=sum((x**i)*(x**j)) ! Phi{i,j}=<phi{},phi{} >
        end do
        b(i+1)=sum((x**i)*y)
      end do
      
      coefs= solve(phi,b)

    end function

  end module
