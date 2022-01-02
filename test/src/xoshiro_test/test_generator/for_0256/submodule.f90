submodule (pkg_xoshiro_test : imp_test_generator) imp_for_0256

    ! contained <subroutine>s and <function>s are below
    contains


    module procedure for_0256

        ! STEP.01
        print '("[",A,"]")' , 'without jump of the generator state'
        call generator%set_state( [ 0_INT64 , 0_INT64 , 0_INT64 , 1_INT64 ] )
        call show_sample( generator )

        ! STEP.02
        print '("[",A,"]")' , 'with a jump of the generator state'
        call generator%set_state( [ 0_INT64 , 0_INT64 , 0_INT64 , 1_INT64 ] )
        call generator%jump_state
        call show_sample( generator )

        ! STEP.03
        print '("[",A,"]")' , 'with a long jump of the generator state'
        call generator%set_state( [ 0_INT64 , 0_INT64 , 0_INT64 , 1_INT64 ] )
        call generator%jump_state_long
        call show_sample( generator )

        ! STEP.END
        return

    end procedure for_0256

end submodule imp_for_0256
