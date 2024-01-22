module pkg_xoshiro

    use , intrinsic :: iso_fortran_env , only : INT64
    use , intrinsic :: iso_fortran_env , only : REAL64



    implicit none



    ! default accessibility
    private

    ! kind: type
    public :: typ_generator64_base
    public :: typ_xoshiro256plus1
    public :: typ_xoshiro256plus2
    public :: typ_xoshiro256star2

    ! kind: function
    public :: output_size_state



    integer , parameter :: size_state_xoshiro256 = 4
    !! A `PARAMETER` for this `MODULE`
    !! state array size for
    !! - `xoshiro256+`
    !! - `xoshiro256++`
    !! - `xoshiro256**`



    type , abstract :: typ_generator64_base

        private



        contains



        ! kind: `FUNCTION`

        procedure( output_state_base      ) ,   pass , public , deferred :: output_state
        procedure( output_state_size_base ) , nopass , public , deferred :: output_state_size



        ! kind: `SUBROUTINE`

        procedure , pass , private :: random_number_scalar_real64

        procedure( jump_state_base                 ) , pass , public  , deferred :: jump_state
        procedure( jump_state_core_base            ) , pass , private , deferred :: jump_state_core
        procedure( jump_state_long_base            ) , pass , public  , deferred :: jump_state_long
        procedure( random_number_scalar_int64_base ) , pass , private , deferred :: random_number_scalar_int64
        procedure( set_state_base                  ) , pass , public  , deferred :: set_state
        procedure( update_state_base               ) , pass , public  , deferred :: update_state

        generic , public :: random_number => random_number_scalar_int64
        generic , public :: random_number => random_number_scalar_real64 

    end type typ_generator64_base



    type , abstract , extends(typ_generator64_base) :: typ_xoshiro256

        integer(INT64) , private , dimension(size_state_xoshiro256) :: state
        !! A field of this `TYPE`



        contains



        ! kind: `FUNCTION`

        procedure ,   pass , public :: output_state      => output_state_xoshiro256
        procedure , nopass , public :: output_state_size => output_state_size_xoshiro256



        ! kind: `SUBROUTINE`

        procedure , pass , private :: copy_state_xoshiro256
        procedure , pass , public  :: jump_state            => jump_state_xoshiro256
        procedure , pass , private :: jump_state_core       => jump_state_core_xoshiro256
        procedure , pass , public  :: jump_state_long       => jump_state_long_xoshiro256
        procedure , pass , public  :: set_state             => set_state_xoshiro256
        procedure , pass , public  :: update_state          => update_state_xoshiro256

        generic , public :: copy_state => copy_state_xoshiro256

    end type typ_xoshiro256



    type , extends(typ_xoshiro256) :: typ_xoshiro256plus1

        private

        contains



        ! kind: `SUBROUTINE`

        procedure , pass , private :: random_number_scalar_int64 => random_number_scalar_int64_xoshiro256plus1

    end type typ_xoshiro256plus1



    type , extends(typ_xoshiro256) :: typ_xoshiro256plus2

        private

        contains



        ! kind: `SUBROUTINE`

        procedure , pass , private :: random_number_scalar_int64 => random_number_scalar_int64_xoshiro256plus2

    end type typ_xoshiro256plus2



    type , extends(typ_xoshiro256) :: typ_xoshiro256star2

        private

        contains



        ! kind: `SUBROUTINE`

        procedure , pass , private :: random_number_scalar_int64 => random_number_scalar_int64_xoshiro256star2

    end type typ_xoshiro256star2



    interface rotl

        module pure elemental function rotl64 ( i , shift )

            integer(INT64) , intent(in) :: i
            !! A dummy argument for this `FUNCTION`

            integer , intent(in) :: shift
            !! A dummy argument for this `FUNCTION`

            integer(INT64) :: rotl64
            !! The return value of this `FUNCTION`

        end function rotl64

    end interface rotl



    interface

        module pure elemental function output_size_state ( generator , default ) result( size_state )

            class(typ_generator64_base) , intent(in) :: generator
            !! A dummy argument for this `FUNCTION`

            logical , intent(in) :: default
            !! A dummy argument for this `FUNCTION`

            integer :: size_state
            !! The return value of this `FUNCTION`

        end function output_size_state

    end interface



    interface

        module pure elemental function transform_to_unit_interval ( x ) result( harvest )

            integer(INT64) , intent(in) :: x
            !! A dummy argument for this `FUNCTION`

            real(REAL64) :: harvest
            !! The return value of this `FUNCTION`

        end function transform_to_unit_interval

    end interface



    interface copy_array

        module subroutine copy_array_int64 ( size_dst , size_src , val_dst , val_src )

            integer , intent(in) :: size_dst
            !! A dummy argument for `SUBROUTINE`

            integer , intent(in) :: size_src
            !! A dummy argument for `SUBROUTINE`

            integer(INT64) , dimension(:) , intent(inout) :: val_dst
            !! A dummy argument for `SUBROUTINE`

            integer(INT64) , dimension(:) , intent(in) :: val_src
            !! A dummy argument for `SUBROUTINE`

        end subroutine copy_array_int64

    end interface copy_array



    ! for `ABSTRACT` `TYPE` :: `typ_generator64_base`
    interface

        module pure elemental function output_state_base ( generator , index ) result( state )

            class(typ_generator64_base) , intent(in) :: generator
            !! A dummy argument for this `FUNCTION`

            integer , intent(in) :: index
            !! A dummy argument for this `FUNCTION`

            integer(INT64) :: state
            !! The return value of this `FUNCTION`

        end function output_state_base



        module pure elemental function output_state_size_base () result( state_size )

            integer :: state_size
            !! The return value of this `FUNCTION`

        end function output_state_size_base



        module subroutine jump_state_core_base ( generator , jump_param )

            class(typ_generator64_base) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

            integer(INT64) , dimension(:) , intent(in) :: jump_param
            !! A dummy argument for this `SUBROUTINE`

        end subroutine jump_state_core_base



        module subroutine jump_state_base ( generator )

            class(typ_generator64_base) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

        end subroutine jump_state_base



        module subroutine jump_state_long_base ( generator )

            class(typ_generator64_base) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

        end subroutine jump_state_long_base



        module subroutine random_number_scalar_int64_base ( generator , harvest )

            class(typ_generator64_base) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

            integer(INT64) , intent(out) :: harvest
            !! A dummy argument for this `SUBROUTINE`

        end subroutine random_number_scalar_int64_base



        module subroutine random_number_scalar_real64 ( generator , harvest )

            class(typ_generator64_base) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

            real(REAL64) , intent(out) :: harvest
            !! A dummy argument for this `SUBROUTINE`

        end subroutine random_number_scalar_real64



        module subroutine set_state_base ( generator , state )

            class(typ_generator64_base) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

            integer(INT64) , intent(in) :: state(:)
            !! A dummy argument for this `SUBROUTINE`

        end subroutine set_state_base


        module subroutine update_state_base ( generator )

            class(typ_generator64_base) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

        end subroutine update_state_base

    end interface



    ! for `ABSTRACT` & `EXTENDS` `TYPE` :: `typ_xoshiro256`
    interface

        module pure elemental function output_state_xoshiro256 ( generator , index ) result( state )

            class(typ_xoshiro256) , intent(in) :: generator
            !! A dummy argument for this `FUNCTION`

            integer , intent(in) :: index
            !! A dummy argument for this `FUNCTION`

            integer(INT64) :: state
            !! The return value of this `FUNCTION`

        end function output_state_xoshiro256



        module pure elemental function output_state_size_xoshiro256 () result( state_size )

            integer :: state_size
            !! The return value of this `FUNCTION`

        end function output_state_size_xoshiro256



        module subroutine copy_state_xoshiro256 ( generator , source )

            class(typ_xoshiro256) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

            class(typ_xoshiro256) , intent(in) :: source
            !! A dummy argument for this `SUBROUTINE`

        end subroutine copy_state_xoshiro256



        module subroutine jump_state_xoshiro256 ( generator )

            class(typ_xoshiro256) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

        end subroutine jump_state_xoshiro256



        module subroutine jump_state_core_xoshiro256 ( generator , jump_param )

            class(typ_xoshiro256) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

            integer(INT64) , dimension(:),  intent(in) :: jump_param
            !! A dummy argument for this `SUBROUTINE`

        end subroutine jump_state_core_xoshiro256



        module subroutine jump_state_long_xoshiro256 ( generator )

            class(typ_xoshiro256) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

        end subroutine jump_state_long_xoshiro256



        module subroutine set_state_xoshiro256 ( generator , state )

            class(typ_xoshiro256) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

            integer(INT64) , dimension(:),  intent(in) :: state
            !! A dummy argument for this `SUBROUTINE`

        end subroutine set_state_xoshiro256



        module subroutine update_state_xoshiro256 ( generator )

            class(typ_xoshiro256) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

        end subroutine update_state_xoshiro256

    end interface



    ! for `EXTENDS` `TYPE` :: `typ_xoshiro256plus1`
    interface

        module subroutine random_number_scalar_int64_xoshiro256plus1 ( generator , harvest )

            class(typ_xoshiro256plus1) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

            integer(INT64) , intent(out) :: harvest
            !! A dummy argument for this `SUBROUTINE`

        end subroutine random_number_scalar_int64_xoshiro256plus1

    end interface



    ! for `EXTENDS` `TYPE` :: `typ_xoshiro256plus2`
    interface

        module subroutine random_number_scalar_int64_xoshiro256plus2 ( generator , harvest )

            class(typ_xoshiro256plus2) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

            integer(INT64) , intent(out) :: harvest
            !! A dummy argument for this `SUBROUTINE`

        end subroutine random_number_scalar_int64_xoshiro256plus2

    end interface



    ! for `EXTENDS` `TYPE` :: `typ_xoshiro256star2`
    interface

        module subroutine random_number_scalar_int64_xoshiro256star2 ( generator , harvest )

            class(typ_xoshiro256star2) , intent(inout) :: generator
            !! A dummy argument for this `SUBROUTINE`

            integer(INT64) , intent(out) :: harvest
            !! A dummy argument for this `SUBROUTINE`

        end subroutine random_number_scalar_int64_xoshiro256star2

    end interface

end module pkg_xoshiro
