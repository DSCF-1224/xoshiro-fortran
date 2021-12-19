module pkg_xoshiro

    ! <module>s to import
    use , intrinsic :: iso_fortran_env , only : INT64
    use , intrinsic :: iso_fortran_env , only : REAL64


    ! require all variables to be explicitly declared
    implicit none


    ! accessibility of the <subroutine>s and <function>s in this <module>

    ! default accessibility
    private

    ! kind: type
    public :: typ_xoshiro256plus2


    ! <type>s for this <module>

    type , abstract :: typ_generator64_base

        ! default accessibility of the component(s) of this <type>
        private

        ! component(s) of this <type>
        integer(INT64) , allocatable :: state(:)

        ! contained <procedure>s are below
        contains

        
        ! kind: subroutine
        procedure( allocate_state_base            ) , deferred :: allocate_state
        procedure( deallocate_state_base          ) , deferred :: deallocate_state
        procedure( jump_state_core_base           ) , deferred :: jump_state_core
        procedure( random_number_sclr_int64_base  ) , deferred :: random_number_sclr_int64
        procedure( random_number_sclr_real64_base ) , deferred :: random_number_sclr_real64
        procedure( update_state_base              ) , deferred :: update_state

    end type typ_generator64_base


    type , extends(typ_generator64_base) :: typ_xoshiro256plus2

        ! default accessibility of the component(s) of this <type>
        private

        ! contained <procedure>s are below
        contains

        
        ! kind: subroutine
        procedure :: allocate_state            => allocate_state_xoshiro256plus2
        procedure :: deallocate_state          => deallocate_state_xoshiro256plus2
        procedure :: jump_state_core           => jump_state_core_xoshiro256plus2
        procedure :: random_number_sclr_int64  => random_number_sclr_int64_xoshiro256plus2
        procedure :: random_number_sclr_real64 => random_number_sclr_real64_xoshiro256plus2
        procedure :: update_state              => update_state_xoshiro256plus2

        ! kind: interface
        generic , public :: random_number => random_number_sclr_int64
        generic , public :: random_number => random_number_sclr_real64

    end type typ_xoshiro256plus2


    ! constant(s) for this <module>
    integer , parameter :: size_state_xoshiro256plus2 = 4


    ! <interface>s for this <module>

    interface rotl

        module pure elemental function rotl64 ( i , shift ) result(rotl)

            ! argument(s) for this <function>
            integer (INT64) , intent(in) :: i
            integer         , intent(in) :: shift

            ! return value of this <function>
            integer(INT64) :: rotl

        end function rotl64

    end interface rotl


    ! for abstract <type> :: typ_generator64_base
    interface


        module subroutine allocate_state_base ( generator )

            ! argument(s) for this <subroutine>
            class(typ_generator64_base) , intent(inout) :: generator

        end subroutine allocate_state_base


        module subroutine deallocate_state_base ( generator )

            ! argument(s) for this <subroutine>
            class(typ_generator64_base) , intent(inout) :: generator

        end subroutine deallocate_state_base


        module subroutine jump_state_core_base ( generator , jump_param )

            ! argument(s) for this <subroutine>
            class   (typ_generator64_base) , intent(inout) :: generator
            integer (INT64)                , intent(in)    :: jump_param (:)

        end subroutine jump_state_core_base


        module subroutine random_number_sclr_int64_base ( generator , harvest )

            ! argument(s) for this <subroutine>
            class   (typ_generator64_base) , intent(inout) :: generator
            integer (INT64)                , intent(out)   :: harvest

        end subroutine random_number_sclr_int64_base


        module subroutine random_number_sclr_real64_base ( generator , harvest )

            ! argument(s) for this <subroutine>
            class (typ_generator64_base) , intent(inout) :: generator
            real  (REAL64)               , intent(out)   :: harvest

        end subroutine random_number_sclr_real64_base


        module subroutine update_state_base ( generator )

            ! argument(s) for this <subroutine>
            class(typ_generator64_base) , intent(inout) :: generator

        end subroutine update_state_base

    end interface


    ! for extended <type> :: typ_xoshiro256plus2
    interface

        module subroutine allocate_state_xoshiro256plus2 ( generator )

            ! argument(s) for this <subroutine>
            class(typ_xoshiro256plus2) , intent(inout) :: generator

        end subroutine allocate_state_xoshiro256plus2


        module subroutine deallocate_state_xoshiro256plus2 ( generator )

            ! argument(s) for this <subroutine>
            class(typ_xoshiro256plus2) , intent(inout) :: generator

        end subroutine deallocate_state_xoshiro256plus2


        module subroutine jump_state_core_xoshiro256plus2 ( generator , jump_param )

            ! argument(s) for this <subroutine>
            class   (typ_xoshiro256plus2) , intent(inout) :: generator
            integer (INT64)               , intent(in)    :: jump_param (:)

        end subroutine jump_state_core_xoshiro256plus2


        module subroutine random_number_sclr_int64_xoshiro256plus2 ( generator , harvest )

            ! argument(s) for this <subroutine>
            class   (typ_xoshiro256plus2) , intent(inout) :: generator
            integer (INT64)               , intent(out)   :: harvest

        end subroutine random_number_sclr_int64_xoshiro256plus2


        module subroutine random_number_sclr_real64_xoshiro256plus2 ( generator , harvest )

            ! argument(s) for this <subroutine>
            class (typ_xoshiro256plus2) , intent(inout) :: generator
            real  (REAL64)              , intent(out)   :: harvest

        end subroutine random_number_sclr_real64_xoshiro256plus2


        module subroutine update_state_xoshiro256plus2 ( generator )

            ! argument(s) for this <subroutine>
            class(typ_xoshiro256plus2) , intent(inout) :: generator

        end subroutine update_state_xoshiro256plus2

    end interface

end module pkg_xoshiro
