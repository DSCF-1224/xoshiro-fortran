program xoroshiro128plus2_test

    use ,     intrinsic :: iso_fortran_env                   , only: int64
    use , non_intrinsic :: pkg_xoshiro                       , only: typ_xoroshiro128plus2
    use , non_intrinsic :: pkg_xoroshiro128plus2_c_interface , only: typ_xoroshiro128plus2_c
    use , non_intrinsic :: pkg_xoshiro_test                  , only: execute_test

    implicit none

    type( typ_xoroshiro128plus2   ) :: xoroshiro128plus2_fortran
    type( typ_xoroshiro128plus2_c ) :: xoroshiro128plus2_c

    call execute_test( &!
        prng_c       = xoroshiro128plus2_c       , &!
        prng_fortran = xoroshiro128plus2_fortran , &!
        prng_name    = 'xoroshiro128++'          , &!
        sample_size  = 10                          &!
    )

end program xoroshiro128plus2_test
