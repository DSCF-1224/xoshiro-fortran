submodule (pkg_xoshiro) imp_jump_state

    implicit none



    integer(INT64) , parameter , dimension(size_state_xoshiro256) :: jump_param_xoshiro256 = &!
        [&!
            +1733541517147835066_int64 , &! 0x180ec6d33cfd0aba
            -3051731464161248980_int64 , &! 0xd5a61266f0c9392c
            -6244198995065845334_int64 , &! 0xa9582618e03fc9aa
            +4155657270789760540_int64   &! 0x39abdc4529b1661c
        ]



    contains



    module procedure jump_state_xoshiro256

        call generator%jump_state_core( jump_param_xoshiro256(:) )

    end procedure jump_state_xoshiro256

end submodule imp_jump_state
