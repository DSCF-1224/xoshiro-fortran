module pkg_xoshiro_c_interface

    use , intrinsic :: iso_c_binding , only : c_int
    use , intrinsic :: iso_c_binding , only : c_int32_t
    use , intrinsic :: iso_c_binding , only : c_int64_t



    implicit none



    private
    public  :: c_int
    public  :: c_int32_t
    public  :: c_int64_t
    public  :: typ_generator64_c_base



    type , abstract :: typ_generator64_c_base

        contains

        
        procedure( get_state_base                  ) , public  , nopass , deferred :: output_state
        procedure( jump_state_base                 ) , public  , nopass , deferred :: jump_state
        procedure( jump_state_long_base            ) , public  , nopass , deferred :: jump_state_long
        procedure( random_number_scalar_int64_base ) , private , nopass , deferred :: random_number_scalar_int64
        procedure( set_state_base                  ) , public  , nopass , deferred :: set_state

        generic , public :: random_number => random_number_scalar_int64

    end type typ_generator64_c_base



    interface

        module pure elemental function get_state_base ( i ) result(state)

            integer , intent(in) :: i
            !! A dummy argument for this `FUNCTION`

            integer(c_int64_t) :: state
            !! The return value of this `FUNCTION`

        end function get_state_base



        module subroutine jump_state_base ()

            !! There is no dummy argument for this `SUBROUTINE`

        end subroutine jump_state_base



        module subroutine jump_state_long_base ()

            !! There is no dummy argument for this `SUBROUTINE`

        end subroutine jump_state_long_base



        module subroutine random_number_scalar_int64_base ( harvest )

            integer(c_int64_t) , intent(out) :: harvest
            !! A dummy argument for this `SUBROUTINE`

        end subroutine random_number_scalar_int64_base



        module subroutine set_state_base ( i , new_state )

            integer(c_int) , intent(in) :: i
            !! A dummy argument for this `SUBROUTINE`

            integer(c_int64_t) , intent(in) :: new_state
            !! A dummy argument for this `SUBROUTINE`

        end subroutine set_state_base

    end interface

end module pkg_xoshiro_c_interface
