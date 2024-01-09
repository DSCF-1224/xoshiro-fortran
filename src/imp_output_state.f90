submodule (pkg_xoshiro) imp_output_state

    implicit none

    contains



    module procedure output_state_xoshiro256

        state = generator%state( index )

    end procedure output_state_xoshiro256

end submodule imp_output_state
