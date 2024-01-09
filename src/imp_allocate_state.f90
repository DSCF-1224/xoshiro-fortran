submodule (pkg_xoshiro) imp_allocate_state

    implicit none

    contains



    module procedure allocate_state_xoshiro256

        call generator%deallocate_state
        allocate( generator%state(size_state_xoshiro256) )

    end procedure allocate_state_xoshiro256

end submodule imp_allocate_state
