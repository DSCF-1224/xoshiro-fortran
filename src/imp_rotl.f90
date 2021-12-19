submodule (pkg_xoshiro) imp_rotl

    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure rotl64

        rotl = ior( i= shiftl( i = i , shift= shift ) , j= shiftr( i= i , shift= 64 - shift ) )

    end procedure rotl64

end submodule imp_rotl
