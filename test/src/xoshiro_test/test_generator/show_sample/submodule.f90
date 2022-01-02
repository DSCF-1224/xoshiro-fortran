submodule (pkg_xoshiro_test : imp_test_generator) imp_show_sample

    ! contained <subroutine>s and <function>s are below
    contains


    module procedure show_sample_64bit

        ! support variables for this <procedure>
        integer        :: itr
        integer(INT64) :: sample


        ! STEP.01
        ! Show the generated sample.
        do itr = 1 , len_sample

            select type ( generator )
                type is       ( typ_xoshiro256plus2 ) ; call generator%random_number( sample )
                class default                         ; stop
            end select

            print '(I2,1X,I21.20)' , itr , sample

        end do


        ! STEP.02
        ! Write a blanck line.
        print *


        ! STEP.END
        return

    end procedure show_sample_64bit

end submodule imp_show_sample
