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
    public :: typ_generator64_base
    public :: typ_xoshiro256plus2
    public :: typ_xoshiro256star2

    ! kind: function
    public :: output_size_state



    ! constant(s) for this <module>
    integer , parameter :: size_state_xoshiro256 = 4


    ! <type>s for this <module>

    type , abstract :: typ_generator64_base

        ! default accessibility of the component(s) of this <type>
        private

        ! component(s) of this <type>
        integer(INT64) , allocatable :: state(:)

        ! contained <procedure>s are below
        contains

        ! kind: function
        procedure( output_state_base ) , deferred :: output_state

        ! kind: subroutine
        procedure( allocate_state_base            ) , deferred :: allocate_state
        procedure( copy_state_base                ) , deferred :: copy_state
        procedure( deallocate_state_base          ) , deferred :: deallocate_state
        procedure( jump_state_core_base           ) , deferred :: jump_state_core
        procedure( jump_state_base                ) , deferred :: jump_state
        procedure( jump_state_long_base           ) , deferred :: jump_state_long
        procedure( random_number_sclr_int64_base  ) , deferred :: random_number_sclr_int64
        procedure( random_number_sclr_real64_base ) , deferred :: random_number_sclr_real64
        procedure( set_state_base                 ) , deferred :: set_state
        procedure( update_state_base              ) , deferred :: update_state

    end type typ_generator64_base


    type , extends(typ_generator64_base) :: typ_xoshiro256plus2

        ! default accessibility of the component(s) of this <type>
        private

        ! contained <procedure>s are below
        contains

        ! kind: function
        procedure , public :: output_state => output_state_xoshiro256plus2

        ! kind: subroutine
        procedure :: allocate_state            => allocate_state_xoshiro256plus2
        procedure :: deallocate_state          => deallocate_state_xoshiro256plus2
        procedure :: jump_state_core           => jump_state_core_xoshiro256plus2
        procedure :: random_number_sclr_int64  => random_number_sclr_int64_xoshiro256plus2
        procedure :: random_number_sclr_real64 => random_number_sclr_real64_xoshiro256plus2
        procedure :: update_state              => update_state_xoshiro256plus2

        procedure , public :: copy_state      => copy_state_xoshiro256plus2
        procedure , public :: jump_state      => jump_state_xoshiro256plus2
        procedure , public :: jump_state_long => jump_state_long_xoshiro256plus2
        procedure , public :: set_state       => set_state_xoshiro256plus2


        ! kind: interface
        generic , public :: random_number => random_number_sclr_int64
        generic , public :: random_number => random_number_sclr_real64

    end type typ_xoshiro256plus2


    type , extends(typ_generator64_base) :: typ_xoshiro256star2

        ! default accessibility of the component(s) of this <type>
        private

        ! contained <procedure>s are below
        contains

        ! kind: function
        procedure , public :: output_state => output_state_xoshiro256star2

        ! kind: subroutine
        procedure :: allocate_state            => allocate_state_xoshiro256star2
        procedure :: deallocate_state          => deallocate_state_xoshiro256star2
        procedure :: jump_state_core           => jump_state_core_xoshiro256star2
        procedure :: random_number_sclr_int64  => random_number_sclr_int64_xoshiro256star2
        procedure :: random_number_sclr_real64 => random_number_sclr_real64_xoshiro256star2
        procedure :: update_state              => update_state_xoshiro256star2

        procedure , public :: copy_state      => copy_state_xoshiro256star2
        procedure , public :: jump_state      => jump_state_xoshiro256star2
        procedure , public :: jump_state_long => jump_state_long_xoshiro256star2
        procedure , public :: set_state       => set_state_xoshiro256star2


        ! kind: interface
        generic , public :: random_number => random_number_sclr_int64
        generic , public :: random_number => random_number_sclr_real64

    end type typ_xoshiro256star2


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


    interface

        module pure elemental function output_size_state ( generator , default ) result( size_state )

            ! arguments for this <function>
            class   (typ_generator64_base) , intent(in) :: generator
            logical                        , intent(in) :: default

            ! return value of this <function>
            integer :: size_state

        end function output_size_state

    end interface


    interface

        module pure elemental function transform_to_unit_interval ( x ) result( harvest )

            ! argument(s) for this <function>
            integer(INT64) , intent(in) :: x

            ! return value of this <function>
            real(REAL64) :: harvest

        end function transform_to_unit_interval

    end interface


    interface copy_array

        module subroutine copy_array_int64 ( size_dst , size_src , val_dst , val_src )

            ! arguments for this <subroutine>
            integer         , intent(in)    :: size_dst
            integer         , intent(in)    :: size_src
            integer (INT64) , intent(inout) :: val_dst  (:)
            integer (INT64) , intent(in)    :: val_src  (:)

        end subroutine copy_array_int64

    end interface copy_array


    ! for abstract <type> :: typ_generator64_base
    interface

        module pure elemental function output_state_base ( generator , index ) result( state )

            ! arguments for this <function>
            class   (typ_generator64_base) , intent(in) :: generator
            integer                        , intent(in) :: index

            ! return value of this <function>
            integer(INT64) :: state

        end function output_state_base


        module subroutine allocate_state_base ( generator )

            ! argument(s) for this <subroutine>
            class(typ_generator64_base) , intent(inout) :: generator

        end subroutine allocate_state_base


        module subroutine copy_state_base ( generator , source )

            ! argument(s) for this <subroutine>
            class(typ_generator64_base) , intent(inout) :: generator
            class(typ_generator64_base) , intent(in)    :: source

        end subroutine copy_state_base


        module subroutine deallocate_state_base ( generator )

            ! argument(s) for this <subroutine>
            class(typ_generator64_base) , intent(inout) :: generator

        end subroutine deallocate_state_base


        module subroutine jump_state_core_base ( generator , jump_param )

            ! argument(s) for this <subroutine>
            class   (typ_generator64_base) , intent(inout) :: generator
            integer (INT64)                , intent(in)    :: jump_param (:)

        end subroutine jump_state_core_base


        module subroutine jump_state_base ( generator )

            ! argument(s) for this <subroutine>
            class(typ_generator64_base) , intent(inout) :: generator

        end subroutine jump_state_base


        module subroutine jump_state_long_base ( generator )

            ! argument(s) for this <subroutine>
            class(typ_generator64_base) , intent(inout) :: generator

        end subroutine jump_state_long_base


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


        module subroutine set_state_base ( generator , state )

            ! argument(s) for this <subroutine>
            class   (typ_generator64_base) , intent(inout) :: generator
            integer (INT64)                , intent(in)    :: state(:)

        end subroutine set_state_base


        module subroutine update_state_base ( generator )

            ! argument(s) for this <subroutine>
            class(typ_generator64_base) , intent(inout) :: generator

        end subroutine update_state_base

    end interface


    ! for extended <type> :: typ_xoshiro256plus2
    interface

        module pure elemental function output_state_xoshiro256plus2 ( generator , index ) result( state )

            ! arguments for this <function>
            class   (typ_xoshiro256plus2) , intent(in) :: generator
            integer                       , intent(in) :: index

            ! return value of this <function>
            integer(INT64) :: state

        end function output_state_xoshiro256plus2


        module subroutine allocate_state_xoshiro256plus2 ( generator )

            ! argument(s) for this <subroutine>
            class(typ_xoshiro256plus2) , intent(inout) :: generator

        end subroutine allocate_state_xoshiro256plus2


        module subroutine copy_state_xoshiro256plus2 ( generator , source )

            ! argument(s) for this <subroutine>
            class(typ_xoshiro256plus2)  , intent(inout) :: generator
            class(typ_generator64_base) , intent(in)    :: source

        end subroutine copy_state_xoshiro256plus2


        module subroutine deallocate_state_xoshiro256plus2 ( generator )

            ! argument(s) for this <subroutine>
            class(typ_xoshiro256plus2) , intent(inout) :: generator

        end subroutine deallocate_state_xoshiro256plus2


        module subroutine jump_state_core_xoshiro256plus2 ( generator , jump_param )

            ! argument(s) for this <subroutine>
            class   (typ_xoshiro256plus2) , intent(inout) :: generator
            integer (INT64)               , intent(in)    :: jump_param (:)

        end subroutine jump_state_core_xoshiro256plus2


        module subroutine jump_state_xoshiro256plus2 ( generator )

            ! argument(s) for this <subroutine>
            class(typ_xoshiro256plus2) , intent(inout) :: generator

        end subroutine jump_state_xoshiro256plus2


        module subroutine jump_state_long_xoshiro256plus2 ( generator )

            ! argument(s) for this <subroutine>
            class(typ_xoshiro256plus2) , intent(inout) :: generator

        end subroutine jump_state_long_xoshiro256plus2


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


        module subroutine set_state_xoshiro256plus2 ( generator , state )

            ! argument(s) for this <subroutine>
            class   (typ_xoshiro256plus2) , intent(inout) :: generator
            integer (INT64)               , intent(in)    :: state(:)

        end subroutine set_state_xoshiro256plus2


        module subroutine update_state_xoshiro256plus2 ( generator )

            ! argument(s) for this <subroutine>
            class(typ_xoshiro256plus2) , intent(inout) :: generator

        end subroutine update_state_xoshiro256plus2

    end interface


    ! for extended <type> :: typ_xoshiro256star2
    interface

        module pure elemental function output_state_xoshiro256star2 ( generator , index ) result( state )

            ! arguments for this <function>
            class   (typ_xoshiro256star2) , intent(in) :: generator
            integer                       , intent(in) :: index

            ! return value of this <function>
            integer(INT64) :: state

        end function output_state_xoshiro256star2


        module subroutine allocate_state_xoshiro256star2 ( generator )

            ! argument(s) for this <subroutine>
            class(typ_xoshiro256star2) , intent(inout) :: generator

        end subroutine allocate_state_xoshiro256star2


        module subroutine copy_state_xoshiro256star2 ( generator , source )

            ! argument(s) for this <subroutine>
            class(typ_xoshiro256star2)  , intent(inout) :: generator
            class(typ_generator64_base) , intent(in)    :: source

        end subroutine copy_state_xoshiro256star2


        module subroutine deallocate_state_xoshiro256star2 ( generator )

            ! argument(s) for this <subroutine>
            class(typ_xoshiro256star2) , intent(inout) :: generator

        end subroutine deallocate_state_xoshiro256star2


        module subroutine jump_state_core_xoshiro256star2 ( generator , jump_param )

            ! argument(s) for this <subroutine>
            class   (typ_xoshiro256star2) , intent(inout) :: generator
            integer (INT64)               , intent(in)    :: jump_param (:)

        end subroutine jump_state_core_xoshiro256star2


        module subroutine jump_state_xoshiro256star2 ( generator )

            ! argument(s) for this <subroutine>
            class(typ_xoshiro256star2) , intent(inout) :: generator

        end subroutine jump_state_xoshiro256star2


        module subroutine jump_state_long_xoshiro256star2 ( generator )

            ! argument(s) for this <subroutine>
            class(typ_xoshiro256star2) , intent(inout) :: generator

        end subroutine jump_state_long_xoshiro256star2


        module subroutine random_number_sclr_int64_xoshiro256star2 ( generator , harvest )

            ! argument(s) for this <subroutine>
            class   (typ_xoshiro256star2) , intent(inout) :: generator
            integer (INT64)               , intent(out)   :: harvest

        end subroutine random_number_sclr_int64_xoshiro256star2


        module subroutine random_number_sclr_real64_xoshiro256star2 ( generator , harvest )

            ! argument(s) for this <subroutine>
            class (typ_xoshiro256star2) , intent(inout) :: generator
            real  (REAL64)              , intent(out)   :: harvest

        end subroutine random_number_sclr_real64_xoshiro256star2


        module subroutine set_state_xoshiro256star2 ( generator , state )

            ! argument(s) for this <subroutine>
            class   (typ_xoshiro256star2) , intent(inout) :: generator
            integer (INT64)               , intent(in)    :: state(:)

        end subroutine set_state_xoshiro256star2


        module subroutine update_state_xoshiro256star2 ( generator )

            ! argument(s) for this <subroutine>
            class(typ_xoshiro256star2) , intent(inout) :: generator

        end subroutine update_state_xoshiro256star2

    end interface

end module pkg_xoshiro
