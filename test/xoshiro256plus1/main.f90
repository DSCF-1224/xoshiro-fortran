program xoshiro256plus1_test

    use ,     intrinsic :: iso_fortran_env                 , only: int64
    use , non_intrinsic :: pkg_xoshiro                     , only: typ_xoshiro256plus1
    use , non_intrinsic :: pkg_xoshiro256plus1_c_interface , only: typ_xoshiro256plus1_c
    use , non_intrinsic :: pkg_xoshiro_test                , only: execute_test

    implicit none

    type( typ_xoshiro256plus1   ) :: xoshiro256plus1_fortran
    type( typ_xoshiro256plus1_c ) :: xoshiro256plus1_c

    call execute_test( &!
        prng_c       = xoshiro256plus1_c       , &!
        prng_fortran = xoshiro256plus1_fortran , &!
        prng_name    = 'xoshiro256+'           , &!
        sample_size  = 10                        &!
    )

end program xoshiro256plus1_test
