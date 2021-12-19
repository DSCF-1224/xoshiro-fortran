submodule (pkg_xoshiro) imp_deallocate_state

    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure deallocate_state_xoshiro256plus2

        if ( allocated( generator%state ) ) then
            deallocate( generator%state )
        end if

        return

    end procedure deallocate_state_xoshiro256plus2

end submodule imp_deallocate_state
