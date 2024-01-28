program xoroshiro128plus1_test

    use ,     intrinsic :: iso_fortran_env                   , only: int64
    use , non_intrinsic :: pkg_xoshiro                       , only: typ_xoroshiro128plus1
    use , non_intrinsic :: pkg_xoroshiro128plus1_c_interface , only: typ_xoroshiro128plus1_c
    use , non_intrinsic :: pkg_xoshiro_test                  , only: execute_test

    implicit none

    type( typ_xoroshiro128plus1   ) :: xoroshiro128plus1_fortran
    type( typ_xoroshiro128plus1_c ) :: xoroshiro128plus1_c

    call execute_test( &!
        prng_c       = xoroshiro128plus1_c       , &!
        prng_fortran = xoroshiro128plus1_fortran , &!
        prng_name    = 'xoroshiro128+'           , &!
        sample_size  = 10                          &!
    )

end program xoroshiro128plus1_test
