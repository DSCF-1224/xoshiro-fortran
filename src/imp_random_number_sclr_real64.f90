submodule (pkg_xoshiro) imp_random_number_sclr_real64

    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure random_number_sclr_real64_xoshiro256plus2

        ! variable(s) for this <subroutine>
        integer(INT64) :: buffer

        call generator%random_number( buffer )
        call generator%update_state
        harvest = transfer( source= buffer , mold= harvest )
        return

    end procedure random_number_sclr_real64_xoshiro256plus2

end submodule imp_random_number_sclr_real64
