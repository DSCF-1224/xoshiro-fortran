submodule (pkg_xoshiro) imp_jump_state

    implicit none



    integer(INT64) , parameter , dimension(size_state_xoshiro256) :: jump_param_xoshiro256 = &!
        [&!
            +1733541517147835066_int64 , &! 0x180ec6d33cfd0aba
            -3051731464161248980_int64 , &! 0xd5a61266f0c9392c
            -6244198995065845334_int64 , &! 0xa9582618e03fc9aa
            +4155657270789760540_int64   &! 0x39abdc4529b1661c
        ]



    integer(INT64) , parameter , dimension(size_state_xoshiro512) :: jump_param_xoshiro512 = &!
        [&!
            +3741798284078044153_int64 , &! 0x33ed89b6e7a353f9
            +8502941058421957566_int64 , &! 0x760083d7955323be
            +2898052048139464622_int64 , &! 0x2837f2fbb5f22fae
            +5443821109340885276_int64 , &! 0x4b8c5674d309511c
            -5685015549262525403_int64 , &! 0xb11ac47a7ba28c25
            -1027253480086320100_int64 , &! 0xf1be7667092bcc1c
            +6018250552094165679_int64 , &! 0x53851efdb6df0aaf
            +2214584309664130523_int64   &! 0x1ebbc8b23eaf25db
        ]



    contains



    module procedure jump_state_xoroshiro128plus1

        call generator%jump_state_core( &!
            [ &!
                -2337365368286915419_int64 , &! 0xdf900294d8f554a5
                +1659688472399708668_int64   &! 0x170865df4b3201fc
            ] &!
        )

    end procedure jump_state_xoroshiro128plus1



    module procedure jump_state_xoroshiro128plus2

        call generator%jump_state_core( &!
            [ &!
                +3159176899437800924_int64 , &! 0x2bd7a6a6e99c2ddc
                + 689838746718161413_int64   &! 0x0992ccaf6a6fca05
            ] &!
        )

    end procedure jump_state_xoroshiro128plus2



    module procedure jump_state_xoroshiro128star2

        call generator%jump_state_core( &!
            [ &!
                -2337365368286915419_int64 , &! 0xdf900294d8f554a5
                +1659688472399708668_int64   &! 0x170865df4b3201fc
            ] &!
        )

    end procedure jump_state_xoroshiro128star2



    module procedure jump_state_xoshiro256

        call generator%jump_state_core( jump_param_xoshiro256(:) )

    end procedure jump_state_xoshiro256



    module procedure jump_state_xoshiro512

        call generator%jump_state_core( jump_param_xoshiro512(:) )

    end procedure jump_state_xoshiro512

end submodule imp_jump_state
