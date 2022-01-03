submodule (pkg_xoshiro_test : imp_test_generator) imp_show_table_column

    ! contained <subroutine>s and <function>s are below
    contains


    module procedure show_table_column_64bit

        print '("|",A6,"|",I2,"|`",Z16.16,"`|")' , comment , itr , value
        return

    end procedure show_table_column_64bit

end submodule imp_show_table_column
