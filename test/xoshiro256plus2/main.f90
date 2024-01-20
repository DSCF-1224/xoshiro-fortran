program xoshiro256plus2_test

    use ,     intrinsic :: iso_fortran_env                 , only: int64
    use , non_intrinsic :: pkg_xoshiro                     , only: typ_xoshiro256plus2
    use , non_intrinsic :: pkg_xoshiro256plus2_c_interface , only: typ_xoshiro256plus2_c
    use , non_intrinsic :: pkg_xoshiro_test                , only: execute_test

    implicit none

    type( typ_xoshiro256plus2   ) :: xoshiro256plus2_fortran
    type( typ_xoshiro256plus2_c ) :: xoshiro256plus2_c

    call execute_test( &!
        prng_c       = xoshiro256plus2_c       , &!
        prng_fortran = xoshiro256plus2_fortran , &!
        prng_name    = 'xoshiro256++'          , &!
        sample_size  = 10                        &!
    )

end program xoshiro256plus2_test
