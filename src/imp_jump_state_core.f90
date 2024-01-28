submodule (pkg_xoshiro) imp_jump_state_core

    implicit none

    contains



    module procedure jump_state_core_xoroshiro128

        integer(INT64) :: buffer_state( size( generator%state(:) ) )
        !! A variable for this `SUBROUTINE`



        integer :: itr_pos
        !! A support variable for this `SUBROUTINE`

        integer :: itr_prm
        !! A support variable for this `SUBROUTINE`



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

    end procedure jump_state_core_xoroshiro128



    module procedure jump_state_core_xoshiro256

        integer(INT64) :: buffer_state( size( generator%state(:) ) )
        !! A variable for this `SUBROUTINE`



        integer :: itr_pos
        !! A support variable for this `SUBROUTINE`

        integer :: itr_prm
        !! A support variable for this `SUBROUTINE`



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

    end procedure jump_state_core_xoshiro256



    module procedure jump_state_core_xoshiro512

        integer(INT64) :: buffer_state( size( generator%state(:) ) )
        !! A variable for this `SUBROUTINE`



        integer :: itr_pos
        !! A support variable for this `SUBROUTINE`

        integer :: itr_prm
        !! A support variable for this `SUBROUTINE`



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

    end procedure jump_state_core_xoshiro512

end submodule imp_jump_state_core
