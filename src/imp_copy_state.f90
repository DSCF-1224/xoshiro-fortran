submodule (pkg_xoshiro) imp_copy_state

    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure copy_state_xoshiro256plus2

        generator%state(:) = source%state(:)
        return

    end procedure copy_state_xoshiro256plus2

end submodule imp_copy_state
