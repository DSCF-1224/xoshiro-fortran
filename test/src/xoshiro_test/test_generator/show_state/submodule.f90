submodule (pkg_xoshiro_test : imp_test_generator) imp_show_state

    ! contained <subroutine>s and <function>s are below
    contains


    module procedure show_state_64bit

        ! support variables for this <procedure>
        integer :: itr

        ! STEP.01
        ! Show the generated sample.
        do itr = 1 , output_size_state( generator , .true. )

            call show_table_column (                      &!
                comment = "state "                      , &!
                itr     = itr - 1                       , &!
                value   = generator%output_state( itr )   &!
            )

        end do

        ! STEP.END
        return

    end procedure show_state_64bit

end submodule imp_show_state
