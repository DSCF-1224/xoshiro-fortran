submodule (pkg_xoshiro) imp_update_state

    implicit none

    contains



    module procedure update_state_xoshiro256

        integer(INT64) :: temp
        !! A support variable for this `PROCEDURE`



        temp               = shiftl( i = generator%state(2) , shift = 17                 )
        generator%state(3) =   ieor( i = generator%state(3) , j     = generator%state(1) )
        generator%state(4) =   ieor( i = generator%state(4) , j     = generator%state(2) )
        generator%state(2) =   ieor( i = generator%state(2) , j     = generator%state(3) )
        generator%state(1) =   ieor( i = generator%state(1) , j     = generator%state(4) )
        generator%state(3) =   ieor( i = generator%state(3) , j     = temp               )
        generator%state(4) =   rotl( i = generator%state(4) , shift = 45                 )

    end procedure update_state_xoshiro256



    module procedure update_state_xoshiro512

        integer(INT64) :: temp
        !! A support variable for this `PROCEDURE`



        temp               = shiftl( i = generator%state(2) , shift = 11                 )
        generator%state(3) =   ieor( i = generator%state(3) , j     = generator%state(1) )
        generator%state(6) =   ieor( i = generator%state(6) , j     = generator%state(2) )
        generator%state(2) =   ieor( i = generator%state(2) , j     = generator%state(3) )
        generator%state(8) =   ieor( i = generator%state(8) , j     = generator%state(4) )
        generator%state(4) =   ieor( i = generator%state(4) , j     = generator%state(5) )
        generator%state(5) =   ieor( i = generator%state(5) , j     = generator%state(6) )
        generator%state(1) =   ieor( i = generator%state(1) , j     = generator%state(7) )
        generator%state(7) =   ieor( i = generator%state(7) , j     = generator%state(8) )
        generator%state(7) =   ieor( i = generator%state(7) , j     = temp               )
        generator%state(8) =   rotl( i = generator%state(8) , shift = 21                 )

    end procedure update_state_xoshiro512

end submodule imp_update_state
