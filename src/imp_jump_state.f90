submodule (pkg_xoshiro) imp_jump_state

    ! constant(s) for this <submodule>
    integer(INT64) , parameter :: jump_param_xoshiro256plus2( 4 ) = &!
        [&!
            transfer( source= Z'180ec6d33cfd0aba' , mold= 0_INT64 ) , &!
            transfer( source= Z'd5a61266f0c9392c' , mold= 0_INT64 ) , &!
            transfer( source= Z'a9582618e03fc9aa' , mold= 0_INT64 ) , &!
            transfer( source= Z'39abdc4529b1661c' , mold= 0_INT64 )   &!
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
