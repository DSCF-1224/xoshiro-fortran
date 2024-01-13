submodule (pkg_xoshiro) imp_output_size_state

    implicit none

    contains



    module procedure output_state_size_xoshiro256

        state_size = size_state_xoshiro256

    end procedure output_state_size_xoshiro256

end submodule imp_output_size_state
