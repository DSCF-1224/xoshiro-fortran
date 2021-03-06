submodule (pkg_xoshiro) imp_allocate_state

    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure allocate_state_xoshiro256plus2

        call generator%deallocate_state
        allocate( generator%state( size_state_xoshiro256plus2 ) )
        return

    end procedure allocate_state_xoshiro256plus2


    module procedure allocate_state_xoshiro256star2

        call generator%deallocate_state
        allocate( generator%state( size_state_xoshiro256star2 ) )
        return

    end procedure allocate_state_xoshiro256star2

end submodule imp_allocate_state
