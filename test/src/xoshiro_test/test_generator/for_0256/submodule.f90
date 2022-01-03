submodule (pkg_xoshiro_test : imp_test_generator) imp_for_0256

    ! contained <subroutine>s and <function>s are below
    contains


    module procedure for_0256

        ! STEP.01
        call show_header       ( 4 , 'without jump of the generator state' )
        call set_state         ( generator )
        call show_table_header
        call show_state        ( generator )
        call show_sample       ( generator )

        ! STEP.02
        call show_header          ( 4 , 'with a jump of the generator state' )
        call set_state            ( generator )
        call show_table_header
        call show_state           ( generator )
        call generator%jump_state
        call show_state           ( generator )
        call show_sample          ( generator )

        ! STEP.03
        call show_header               ( 4 , 'with a long jump of the generator state' )
        call set_state                 ( generator )
        call show_table_header
        call show_state                ( generator )
        call generator%jump_state_long
        call show_state                ( generator )
        call show_sample               ( generator )

        ! STEP.END
        return

    end procedure for_0256


    subroutine set_state ( generator )

        ! arguments for this <subroutine>
        class( typ_generator64_base ) , intent(inout) :: generator

        call generator%set_state( [ 0_INT64 , 0_INT64 , 0_INT64 , 1_INT64 ] )
        return

    end subroutine set_state

end submodule imp_for_0256
