program xoshiro512plus2_test

    use ,     intrinsic :: iso_fortran_env                 , only: int64
    use , non_intrinsic :: pkg_xoshiro                     , only: typ_xoshiro512plus2
    use , non_intrinsic :: pkg_xoshiro512plus2_c_interface , only: typ_xoshiro512plus2_c
    use , non_intrinsic :: pkg_xoshiro_test                , only: execute_test

    implicit none

    type( typ_xoshiro512plus2   ) :: xoshiro512plus2_fortran
    type( typ_xoshiro512plus2_c ) :: xoshiro512plus2_c

    call execute_test( &!
        prng_c       = xoshiro512plus2_c       , &!
        prng_fortran = xoshiro512plus2_fortran , &!
        prng_name    = 'xoshiro512++'          , &!
        sample_size  = 16                        &!
    )

end program xoshiro512plus2_test
