submodule (pkg_xoshiro) imp_deallocate_state

    implicit none

    contains



    module procedure deallocate_state_xoshiro256

        if ( allocated( generator%state ) ) then
            deallocate( generator%state )
        end if

    end procedure deallocate_state_xoshiro256

end submodule imp_deallocate_state
