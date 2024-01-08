submodule (pkg_xoshiro) imp_jump_state

    ! constant(s) for this <submodule>
    integer(INT64) , parameter :: jump_param_xoshiro256plus2( 4 ) = &!
        [&!
            +1733541517147835066_int64 , &!
            -3051731464161248980_int64 , &!
            -6244198995065845334_int64 , &!
            +4155657270789760540_int64   &!
        ]

    integer(INT64) , parameter :: jump_param_xoshiro256star2( size_state_xoshiro256star2 ) = jump_param_xoshiro256plus2(:)


    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure jump_state_xoshiro256plus2

        call generator%jump_state_core( jump_param_xoshiro256plus2 )
        return

    end procedure jump_state_xoshiro256plus2


    module procedure jump_state_xoshiro256star2

        call generator%jump_state_core( jump_param_xoshiro256star2 )
        return

    end procedure jump_state_xoshiro256star2

end submodule imp_jump_state
