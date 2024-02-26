    module fft_module
    
      implicit none
    
      double complex, parameter :: I = cmplx(0.0d0, 1.0d0)
      double precision, parameter :: pi = 4.0*atan(1.0d0)
    
    contains
    
      recursive subroutine fft(fn, Fk, N)
    
        implicit none
    
        integer, intent(in) :: N
        double complex, intent(in) :: fn(0:N-1)
        double complex, intent(inout) :: Fk(0:N-1)
    
        double complex :: F_even(0:N/2-1)
        double complex :: F_odd(0:N/2-1)
    
        double complex :: omega
    
        integer :: k
    
        if (N == 1) then
           Fk(0) = fn(0)
           return
    
        else
    
           call fft(fn(0:N-1:2), F_even, N/2)
           call fft(fn(1:N-1:2), F_odd, N/2)
    
           omega = exp(-2*pi*I/N)
    
           do k = 0, N/2-1
              Fk(k) = F_even(k) + omega**k * F_odd(k)
              Fk(k + N/2) = F_even(k) - omega**k * F_odd(k)
           enddo
    
           return
    
        endif
    
      end subroutine fft
    
    end module fft_module
    
