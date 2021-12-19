submodule (pkg_xoshiro) imp_jump_state_long

    ! constant(s) for this <submodule>
    integer(INT64) , parameter :: jump_param_xoshiro256plus2( 4 ) = &!
        [&!
            transfer( source= Z'76e15d3efefdcbbf' , mold= 0_INT64 ) , &!
            transfer( source= Z'c5004e441c522fb3' , mold= 0_INT64 ) , &!
            transfer( source= Z'77710069854ee241' , mold= 0_INT64 ) , &!
            transfer( source= Z'39109bb02acbe635' , mold= 0_INT64 )   &!
        ]


    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure jump_state_long_xoshiro256plus2

        call generator%jump_state_core( jump_param_xoshiro256plus2 )
        return

    end procedure jump_state_long_xoshiro256plus2

end submodule imp_jump_state_long
