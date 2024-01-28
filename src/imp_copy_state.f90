submodule (pkg_xoshiro) imp_copy_state

    implicit none

    contains



    module procedure copy_state_xoroshiro128

        generator % state(:) = &!
        source    % state(:)

    end procedure copy_state_xoroshiro128



    module procedure copy_state_xoshiro256

        generator % state(:) = &!
        source    % state(:)

    end procedure copy_state_xoshiro256



    module procedure copy_state_xoshiro512

        generator % state(:) = &!
        source    % state(:)

    end procedure copy_state_xoshiro512

end submodule imp_copy_state
