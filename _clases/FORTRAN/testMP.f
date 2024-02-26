      program hola
    
      !#ifdef _OPENMP
        use omp_lib
      !#endif
    
      integer :: imp_rank
    
      !$omp parallel private(omp_rank)
      omp_rank=0
      !$omp_rank = omp_get_thread_num()
      write(*,*), 'Hello world!', omp_rank
      !$omp end parallel
    
      end program

      !Para correrlo: gfortran -openmp testMP.f
      ! mpirun -np 4 a.out
