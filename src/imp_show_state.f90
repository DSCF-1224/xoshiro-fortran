submodule (pkg_xoshiro) imp_show_state

    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure show_state_xoshiro256plus2

        print '(A2,I20)' , 's1' , generator%state(1)
        print '(A2,I20)' , 's2' , generator%state(2)
        print '(A2,I20)' , 's3' , generator%state(3)
        print '(A2,I20)' , 's4' , generator%state(4)
        return

    end procedure show_state_xoshiro256plus2

end submodule imp_show_state
