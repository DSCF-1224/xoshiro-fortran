submodule (pkg_xoshiro_test : imp_test_generator) imp_show_table_header

    ! contained <subroutine>s and <function>s are below
    contains


    module procedure show_table_header

        print '("|",*(A,"|"))' , "kind" , "itr" , "value"
        print '("|",*(A,"|"))' , ":-"   , "-:"  , ":-:"
        return

    end procedure show_table_header

end submodule imp_show_table_header
