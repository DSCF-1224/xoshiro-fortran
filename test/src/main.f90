program xoshiro_test

    ! <module>s to import
    use ,     intrinsic :: iso_fortran_env
    use , non_intrinsic :: pkg_xoshiro
    use , non_intrinsic :: pkg_xoshiro_test


    ! require all variables to be explicitly declared
    implicit none


    ! support variables for this <program>
    type( typ_xoshiro256plus2 ) :: xoshiro256plus2


    call test_generator( xoshiro256plus2 )

end program xoshiro_test
