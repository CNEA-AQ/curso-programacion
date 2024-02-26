    module dft_module
    
      implicit none
    
      double complex, parameter :: I = cmplx(0.0d0, 1.0d0)
      double precision, parameter :: pi = 4.0*atan(1.0d0)
    
    contains
    
      subroutine dft(fn, Fk, N)
    
        implicit none
    
        integer, intent(in) :: N
        double complex, intent(in) :: fn(0:N-1)
        double complex, intent(inout) :: Fk(0:N-1)
    
        integer :: k, m
    
        do k = 0, N-1
           Fk(k) = 0.0d0
           do m = 0, N-1
              Fk(k) = Fk(k) + fn(m)*exp(-2.0*pi*I*m*k/N)
           enddo
        enddo
    
      end subroutine dft
    
    end module 
