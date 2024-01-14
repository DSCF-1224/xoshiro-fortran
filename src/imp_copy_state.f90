submodule (pkg_xoshiro) imp_copy_state

    implicit none

    contains



    module procedure copy_state_xoshiro256

        generator % state(:) = &!
        source    % state(:)

    end procedure copy_state_xoshiro256

end submodule imp_copy_state
