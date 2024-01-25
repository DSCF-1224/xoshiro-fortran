submodule (pkg_xoshiro) imp_jump_state_long

    implicit none



    integer(INT64) , parameter , dimension(size_state_xoshiro256) :: jump_param_xoshiro256 = &!
        [&!
            +8566230491382795199_int64 , &! 0x76e15d3efefdcbbf
            -4251311993797857357_int64 , &! 0xc5004e441c522fb3
            +8606660816089834049_int64 , &! 0x77710069854ee241
            +4111957640723818037_int64   &! 0x39109bb02acbe635
        ]



    integer(INT64) , parameter , dimension(size_state_xoshiro512) :: jump_param_xoshiro512 = &!
        [&!
            +1244823013897149736_int64 , &! 0x11467fef8f921d28
            -6726097512419258712_int64 , &! 0xa2a819f2e79c8ea8
            -6329352143493687910_int64 , &! 0xa8299fc284b3959a
            -5416907637920481567_int64 , &! 0xb4d347340ca63ee1
            +2067315007917389518_int64 , &! 0x1cb0940bedbff6ce
            -2785821869681439209_int64 , &! 0xd956c5c4fa1f8e17
            -7971871629798370372_int64 , &! 0x915e38fd4eda93bc
            +6574356031248116901_int64   &! 0x5b3ccdfa5d7daca5
        ]



    contains



    module procedure jump_state_long_xoshiro256

        call generator%jump_state_core( jump_param_xoshiro256(:) )

    end procedure jump_state_long_xoshiro256



    module procedure jump_state_long_xoshiro512

        call generator%jump_state_core( jump_param_xoshiro512(:) )

    end procedure jump_state_long_xoshiro512

end submodule imp_jump_state_long
