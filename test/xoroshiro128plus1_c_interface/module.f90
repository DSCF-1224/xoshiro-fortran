module pkg_xoroshiro128plus1_c_interface

    use , non_intrinsic :: pkg_xoshiro_c_interface , only: c_int
    use , non_intrinsic :: pkg_xoshiro_c_interface , only: c_int32_t
    use , non_intrinsic :: pkg_xoshiro_c_interface , only: c_int64_t
    use , non_intrinsic :: pkg_xoshiro_c_interface , only: typ_generator64_c_base



    implicit none



    private
    public  :: typ_xoroshiro128plus1_c



    type , extends(typ_generator64_c_base) :: typ_xoroshiro128plus1_c

        contains



        ! kind: `FUNCTION`

        procedure , public  , nopass :: output_state               => get_state_xoroshiro128plus1



        ! kind: `SUBROUTINE`

        procedure , public  , nopass :: jump_state                 => jump_state_xoroshiro128plus1
        procedure , public  , nopass :: jump_state_long            => jump_state_long_xoroshiro128plus1
        procedure , private , nopass :: random_number_scalar_int64 => random_number_scalar_int64_xoroshiro128plus1
        procedure , public  , nopass :: set_state                  => set_state_xoroshiro128plus1

    end type typ_xoroshiro128plus1_c



    interface

        pure function get_state_c_interface ( i ) result(state) bind(C, name="output_state")

            import :: c_int, c_int64_t

            integer(c_int) , intent(in) , value :: i
            !! A dummy argument for this `FUNCTION`

            integer(c_int64_t) :: state
            !! The return value of this `FUNCTION`

        end function get_state_c_interface



        function next_c_interface() result( harvest ) bind(C, name="next")

            import :: c_int64_t

            integer(c_int64_t) :: harvest
            !! The return value of this `FUNCTION`

        end function next_c_interface



        subroutine jump_c_interface() bind(C, name="jump")
        end subroutine jump_c_interface



        subroutine long_jump_c_interface() bind(C, name="long_jump")
        end subroutine long_jump_c_interface



        subroutine set_state_c_interface ( i , new_state ) bind(C, name="set_state")

            import :: c_int, c_int64_t

            integer(c_int) , intent(in) , value :: i
            !! A dummy argument for this `SUBROUTINE`

            integer(c_int64_t) , intent(in) , value :: new_state
            !! A dummy argument for this `SUBROUTINE`

        end subroutine set_state_c_interface

    end interface



    contains



    pure elemental function get_state_xoroshiro128plus1 ( i ) result(state)

        integer , intent(in) :: i
        !! A dummy argument for this `FUNCTION`

        integer(c_int64_t) :: state
        !! The return value of this `FUNCTION`

        state = get_state_c_interface( i - 1_c_int )

    end function get_state_xoroshiro128plus1



    subroutine jump_state_xoroshiro128plus1 ()
        call jump_c_interface
    end subroutine jump_state_xoroshiro128plus1



    subroutine jump_state_long_xoroshiro128plus1 ()
        call long_jump_c_interface
    end subroutine jump_state_long_xoroshiro128plus1



    subroutine random_number_scalar_int64_xoroshiro128plus1 ( harvest )

        integer(c_int64_t) , intent(out) :: harvest
        !! A dummy argument for this `SUBROUTINE`

        harvest = next_c_interface()

    end subroutine random_number_scalar_int64_xoroshiro128plus1



    subroutine set_state_xoroshiro128plus1 ( i , new_state )

        integer(c_int) , intent(in) :: i
        !! A dummy argument for this `SUBROUTINE`

        integer(c_int64_t) , intent(in) :: new_state
        !! A dummy argument for this `SUBROUTINE`



        call set_state_c_interface( (i - 1_c_int) , new_state )

    end subroutine set_state_xoroshiro128plus1

end module pkg_xoroshiro128plus1_c_interface
