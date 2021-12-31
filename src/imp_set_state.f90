submodule (pkg_xoshiro) imp_set_state

    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure set_state_xoshiro256plus2

        call generator%allocate_state

        if ( size( state(:) ) .lt. size_state_xoshiro256plus2 ) then
            generator%state( :size( state(:) ) ) = state( :size( state(:) ) )
        else
            generator%state( :size_state_xoshiro256plus2 ) = state( :size_state_xoshiro256plus2 )
        end if

        return

    end procedure set_state_xoshiro256plus2

end submodule imp_set_state
