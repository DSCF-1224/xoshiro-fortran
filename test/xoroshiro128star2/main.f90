program xoroshiro128star2_test

    use ,     intrinsic :: iso_fortran_env                   , only: int64
    use , non_intrinsic :: pkg_xoshiro                       , only: typ_xoroshiro128star2
    use , non_intrinsic :: pkg_xoroshiro128star2_c_interface , only: typ_xoroshiro128star2_c
    use , non_intrinsic :: pkg_xoshiro_test                  , only: execute_test

    implicit none

    type( typ_xoroshiro128star2   ) :: xoroshiro128star2_fortran
    type( typ_xoroshiro128star2_c ) :: xoroshiro128star2_c

    call execute_test( &!
        prng_c       = xoroshiro128star2_c       , &!
        prng_fortran = xoroshiro128star2_fortran , &!
        prng_name    = 'xoroshiro128**'          , &!
        sample_size  = 10                          &!
    )

end program xoroshiro128star2_test
