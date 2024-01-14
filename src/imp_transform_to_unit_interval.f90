submodule (pkg_xoshiro) imp_transform_to_unit_interval

    implicit none



    integer(INT64) , parameter :: cnst_ior = shiftl( i= 1023_INT64 , shift= 52 )
    !! A `PARAMETER` for this `SUBMODULE`



    contains



    module procedure transform_to_unit_interval

        harvest = transfer( source= ior( i= cnst_ior , j= shiftr( i= x , shift= 12 ) ) , mold= harvest ) - 1.0_REAL64
        return

    end procedure transform_to_unit_interval

end submodule imp_transform_to_unit_interval
