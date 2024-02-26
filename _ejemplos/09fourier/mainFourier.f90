program fourier

  use fft_module, only : fft, dft, pi

  implicit none

  double complex, allocatable :: fn(:)
  double complex, allocatable :: Fk(:)

  double precision, parameter :: xmin = 0.0
  double precision, parameter :: xmax = 50.0
  double precision, parameter :: f_0 = 0.2
  double precision :: h, x
  double precision :: ts, te, fft_time, dft_time

  integer :: i, N

  N = 2
  do while (N <= 16384)

     allocate(fn(0:N-1))
     allocate(Fk(0:N-1))

     h = (xmax - xmin)/N

     do i = 0, N-1
        x = i*h
        fn(i) = cmplx(sin(2*pi*f_0*x), 0.0d0)
     enddo

     call cpu_time(ts)
     call fft(fn, Fk, N)
     call cpu_time(te)

     fft_time = te - ts

     call cpu_time(ts)
     call dft(fn, Fk, N)
     call cpu_time(te)

     dft_time = te - ts

     print *, N, dft_time, fft_time

     deallocate(fn)
     deallocate(Fk)

     N = N*2

  enddo

  !do i = 0, N-1
  !   print *, i, real(Fk(i)), aimag(Fk(i))
  !enddo

end program 
