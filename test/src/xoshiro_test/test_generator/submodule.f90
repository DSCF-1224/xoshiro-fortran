submodule (pkg_xoshiro_test) imp_test_generator

    interface

        module subroutine for_0256 ( generator )

            ! arguments for this <subroutine>
            class(typ_generator64_base) , intent(inout) :: generator

        end subroutine for_0256

    end interface


    interface

        module subroutine show_header ( level , comment )

            ! arguments for this <subroutine>
            integer           , intent(in) :: level
            character (len=*) , intent(in) :: comment

        end subroutine show_header

    end interface


    interface

        module subroutine show_table_header
        end subroutine show_table_header

    end interface


    interface show_sample

        module subroutine show_sample_64bit ( generator )

            ! arguments for this <subroutine>
            class(typ_generator64_base) , intent(inout) :: generator

        end subroutine show_sample_64bit

    end interface show_sample


    interface show_state

        module subroutine show_state_64bit ( generator )

            ! arguments for this <subroutine>
            class(typ_generator64_base) , intent(in) :: generator

        end subroutine show_state_64bit

    end interface show_state


    interface show_table_column

        module subroutine show_table_column_64bit ( comment , itr , value )

            ! arguments for this <subroutine>
            character ( len= * ) , intent(in) :: comment
            integer              , intent(in) :: itr
            integer   (INT64)    , intent(in) :: value

        end subroutine show_table_column_64bit

    end interface show_table_column


    ! contained <subroutine>s and <function>s are below
    contains


    module procedure test_generator_64bit

        select type ( generator )
            type is ( typ_xoshiro256plus2 ) ; call for_0256 ( generator )
        end select

        return

    end procedure test_generator_64bit

end submodule imp_test_generator
