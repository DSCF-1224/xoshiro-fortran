program xoshiro512plus1_test

    use ,     intrinsic :: iso_fortran_env                 , only: int64
    use , non_intrinsic :: pkg_xoshiro                     , only: typ_xoshiro512plus1
    use , non_intrinsic :: pkg_xoshiro512plus1_c_interface , only: typ_xoshiro512plus1_c
    use , non_intrinsic :: pkg_xoshiro_test                , only: execute_test

    implicit none

    type( typ_xoshiro512plus1   ) :: xoshiro512plus1_fortran
    type( typ_xoshiro512plus1_c ) :: xoshiro512plus1_c

    call execute_test( &!
        prng_c       = xoshiro512plus1_c       , &!
        prng_fortran = xoshiro512plus1_fortran , &!
        prng_name    = 'xoshiro512+'           , &!
        sample_size  = 16                        &!
    )

end program xoshiro512plus1_test
