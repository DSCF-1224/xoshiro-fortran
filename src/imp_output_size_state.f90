submodule (pkg_xoshiro) imp_output_size_state

    implicit none

    contains



    module procedure output_state_size_xoroshiro128

        state_size = size_state_xoroshiro128

    end procedure output_state_size_xoroshiro128



    module procedure output_state_size_xoshiro256

        state_size = size_state_xoshiro256

    end procedure output_state_size_xoshiro256



    module procedure output_state_size_xoshiro512

        state_size = size_state_xoshiro512

    end procedure output_state_size_xoshiro512

end submodule imp_output_size_state
