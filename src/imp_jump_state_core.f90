submodule (pkg_xoshiro) imp_jump_state_core

    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure jump_state_core_xoshiro256plus2

        ! STEP.01
        call for_xoshiro256(                                       &!
            generator  = generator                               , &!
            size_state = output_size_state( generator , .true. ) , &!
            jump_param = jump_param(:)                             &!
        )

        ! STEP.END
        return

    end procedure jump_state_core_xoshiro256plus2


    module procedure jump_state_core_xoshiro256star2

        ! STEP.01
        call for_xoshiro256(                                       &!
            generator  = generator                               , &!
            size_state = output_size_state( generator , .true. ) , &!
            jump_param = jump_param(:)                             &!
        )

        ! STEP.END
        return

    end procedure jump_state_core_xoshiro256star2


    subroutine for_xoshiro256 ( generator , size_state , jump_param )

        ! arguments for this <subroutine>
        class   ( typ_generator64_base ) , intent(inout) :: generator
        integer                          , intent(in)    :: size_state
        integer (INT64)                  , intent(in)    :: jump_param (size_state)


        ! variables for this <subroutine>
        integer(INT64) :: buffer_state(size_state)


        ! support variable(s) for this <subroutine>
        integer :: itr_pos
        integer :: itr_prm


        ! STEP.01
        ! Initialize the buffer.
        buffer_state(:) = 0_INT64


        ! STEP.02
        ! Compute the jumped state.
        do itr_prm = 1 , size( jump_param(:) ) , 1
        do itr_pos = 0 , 63                    , 1

            if ( btest( i= jump_param(itr_prm) , pos= itr_pos ) ) then
                buffer_state(:) = ieor( i= buffer_state(:) , j= generator%state(:) )
            end if

            call generator%update_state

        end do
        end do


        ! STEP.03
        ! Save the computed jumped state.
        generator%state(:) = buffer_state(:)


        ! STEP.END
        return

    end subroutine for_xoshiro256

end submodule imp_jump_state_core
