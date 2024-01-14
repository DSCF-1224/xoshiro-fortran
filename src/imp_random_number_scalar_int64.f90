submodule (pkg_xoshiro) imp_random_number_scalar_int64

    implicit none

    contains



    module procedure random_number_scalar_int64_xoshiro256plus2

        associate( state => generator%state )
            harvest = rotl( i = state(1) + state(4) , shift = 23 ) + state(1)
        end associate

        call generator%update_state

    end procedure random_number_scalar_int64_xoshiro256plus2



    module procedure random_number_scalar_int64_xoshiro256star2

        harvest = rotl( i = generator%state(2) * 5_INT64 , shift = 7 ) * 9_INT64

        call generator%update_state

    end procedure random_number_scalar_int64_xoshiro256star2

end submodule imp_random_number_scalar_int64
