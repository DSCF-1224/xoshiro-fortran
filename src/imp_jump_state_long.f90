submodule (pkg_xoshiro) imp_jump_state_long

    ! constant(s) for this <submodule>

    integer(INT64) , parameter :: jump_param_xoshiro256plus2( size_state_xoshiro256plus2 ) = &!
        [&!
            transfer( source=  8566230491382795199_int64 , mold= 0_INT64 ) , &!
            transfer( source= -4251311993797857357_int64 , mold= 0_INT64 ) , &!
            transfer( source=  8606660816089834049_int64 , mold= 0_INT64 ) , &!
            transfer( source=  4111957640723818037_int64 , mold= 0_INT64 )   &!
        ]

    integer(INT64) , parameter :: jump_param_xoshiro256star2( size_state_xoshiro256star2 ) = jump_param_xoshiro256plus2(:)


    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure jump_state_long_xoshiro256plus2

        call generator%jump_state_core( jump_param_xoshiro256plus2 )
        return

    end procedure jump_state_long_xoshiro256plus2


    module procedure jump_state_long_xoshiro256star2

        call generator%jump_state_core( jump_param_xoshiro256star2 )
        return

    end procedure jump_state_long_xoshiro256star2

end submodule imp_jump_state_long
