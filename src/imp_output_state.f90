submodule (pkg_xoshiro) imp_output_state

    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure output_state_xoshiro256plus2

        state = generator%state( index )

    end procedure output_state_xoshiro256plus2


    module procedure output_state_xoshiro256star2

        state = generator%state( index )

    end procedure output_state_xoshiro256star2

end submodule imp_output_state
