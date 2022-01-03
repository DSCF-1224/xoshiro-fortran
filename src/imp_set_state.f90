submodule (pkg_xoshiro) imp_set_state

    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure set_state_xoshiro256plus2

        ! STEP.01
        call generator%allocate_state

        ! STEP.02
        call copy_array (&!
            size_dst = output_size_state( generator , .true. ) , &!
            size_src = size( state(:) )                        , &!
            val_dst  = generator%state(:)                      , &!
            val_src  = state(:)                                  &!
        )

        ! STEP.END
        return

    end procedure set_state_xoshiro256plus2


    module procedure set_state_xoshiro256star2

        ! STEP.01
        call generator%allocate_state

        ! STEP.02
        call copy_array (&!
            size_dst = output_size_state( generator , .true. ) , &!
            size_src = size( state(:) )                        , &!
            val_dst  = generator%state(:)                      , &!
            val_src  = state(:)                                  &!
        )

        ! STEP.END
        return

    end procedure set_state_xoshiro256star2

end submodule imp_set_state
