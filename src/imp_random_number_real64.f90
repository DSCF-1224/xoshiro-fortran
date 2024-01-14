submodule (pkg_xoshiro) imp_random_number_real64

    implicit none

    contains



    module procedure random_number_scalar_real64

        integer(INT64) :: buffer
        ! A variable for this `SUBROUTINE`



        call generator%random_number_scalar_int64( buffer )
        call generator%update_state
        harvest = transform_to_unit_interval( buffer )

    end procedure random_number_scalar_real64

end submodule imp_random_number_real64
