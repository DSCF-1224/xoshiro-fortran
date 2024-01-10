submodule (pkg_xoshiro) imp_jump_state_long

    implicit none



    integer(INT64) , parameter , dimension(size_state_xoshiro256) :: jump_param_xoshiro256 = &!
        [&!
            +8566230491382795199_int64 , &! 0x76e15d3efefdcbbf
            -4251311993797857357_int64 , &! 0xc5004e441c522fb3
            +8606660816089834049_int64 , &! 0x77710069854ee241
            +4111957640723818037_int64   &! 0x39109bb02acbe635
        ]



    contains



    module procedure jump_state_long_xoshiro256

        call generator%jump_state_core( jump_param_xoshiro256(:) )

    end procedure jump_state_long_xoshiro256

end submodule imp_jump_state_long
