submodule (pkg_xoshiro) imp_copy_state

    implicit none

    contains


    module procedure copy_state_xoshiro256plus2

        generator % state(:size_state_xoshiro256) = &!
        source    % state(:size_state_xoshiro256)
        return

    end procedure copy_state_xoshiro256plus2


    module procedure copy_state_xoshiro256star2

        generator % state(:size_state_xoshiro256) = &!
        source    % state(:size_state_xoshiro256)
        return

    end procedure copy_state_xoshiro256star2

end submodule imp_copy_state
