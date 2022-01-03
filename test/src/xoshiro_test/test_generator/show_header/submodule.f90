submodule (pkg_xoshiro_test : imp_test_generator) imp_show_header

    ! contained <subroutine>s and <function>s are below
    contains


    module procedure show_header

        select case ( level )
            case (:0) ; stop
            case default

                call show_symbol ( level , .true. )
                write( unit= OUTPUT_UNIT , fmt= '(A)' , advance= 'no' ) comment
                call show_symbol ( level , .false. )
                print *
                print *

        end select

        ! STEP.END
        return

    end procedure show_header


    subroutine show_symbol ( level , is_fore )

        ! arguments for this <subroutine>
        integer , intent(in) :: level
        logical , intent(in) :: is_fore

        ! support variables for this <subroutine>
        integer :: itr

        ! STEP.01
        if ( .not. is_fore ) then
            write( unit= OUTPUT_UNIT , fmt= '(1X)' , advance= 'no' )
        end if

        ! STEP.02
        do itr = 1 , level
            write( unit= OUTPUT_UNIT , fmt= '("#")' , advance= 'no' )
        end do

        ! STEP.03
        if ( is_fore ) then
            write( unit= OUTPUT_UNIT , fmt= '(1X)' , advance= 'no' )
        end if

        ! STEP.END
        return

    end subroutine show_symbol

end submodule imp_show_header
