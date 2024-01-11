submodule (pkg_xoshiro) imp_set_state

    implicit none

    contains



    module procedure set_state_xoshiro256

        ! STEP.01
        call generator%allocate_state

        ! STEP.02
        call copy_array (&!
            size_dst = size_state_xoshiro256 , &!
            size_src = size( state(:) )      , &!
            val_dst  = generator%state(:)    , &!
            val_src  = state(:)                &!
        )

    end procedure set_state_xoshiro256

end submodule imp_set_state
