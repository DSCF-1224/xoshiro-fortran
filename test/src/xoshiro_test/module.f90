module pkg_xoshiro_test

    ! <module>s to import
    use ,     intrinsic :: iso_fortran_env
    use , non_intrinsic :: pkg_xoshiro


    ! require all variables to be explicitly declared
    implicit none


    ! accessibility of the <subroutine>s and <function>s in this <module>

    ! default setting
    private

    ! kind: interface
    public :: test_generator


    ! constants for this <module>
    integer , parameter :: len_sample = 10


    ! <interface>s for this <module>
    interface test_generator

        module subroutine test_generator_64bit ( generator )

            ! arguments for this <subroutine>
            class(typ_generator64_base) , intent(inout) :: generator

        end subroutine test_generator_64bit

    end interface test_generator

end module pkg_xoshiro_test
