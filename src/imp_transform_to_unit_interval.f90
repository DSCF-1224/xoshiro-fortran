submodule (pkg_xoshiro) imp_transform_to_unit_interval

    ! constant(s) for this <submodule>
    integer(INT64) , parameter :: cnst_ior = shiftl( i= 1023_INT64 , shift= 52 )


    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure transform_to_unit_interval

        harvest = transfer( source= ior( i= cnst_ior , j= shiftr( i= x , shift= 12 ) ) , mold= harvest ) - 1.0_REAL64
        return

    end procedure transform_to_unit_interval

end submodule imp_transform_to_unit_interval
