submodule (pkg_xoshiro) imp_copy_state

    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure copy_state_xoshiro256plus2

        generator % state( :size_state_xoshiro256plus2 ) = &!
        source    % state( :size_state_xoshiro256plus2 )
        return

    end procedure copy_state_xoshiro256plus2


    module procedure copy_state_xoshiro256star2

        generator % state( :size_state_xoshiro256star2 ) = &!
        source    % state( :size_state_xoshiro256star2 )
        return

    end procedure copy_state_xoshiro256star2

end submodule imp_copy_state
