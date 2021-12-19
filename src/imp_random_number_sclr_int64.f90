submodule (pkg_xoshiro) imp_random_number_sclr_int64

    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure random_number_sclr_int64_xoshiro256plus2

        harvest = rotl( i = generator%state(1) + generator%state(4) , shift = 23 ) + generator%state(1)
        call generator%update_state
        return

    end procedure random_number_sclr_int64_xoshiro256plus2

end submodule imp_random_number_sclr_int64
