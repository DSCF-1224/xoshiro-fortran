submodule (pkg_xoshiro) imp_update_state

    implicit none

    contains



    module procedure update_state_core_xoroshiro128

        integer(INT64) , dimension(size_state_xoroshiro128) :: state
        !! A support variable for this `PROCEDURE`



        state(:) = generator%state(:)

        state(2) = ieor( i = state(1) , j = state(2) )

        associate ( &!
            i => ieor( i = rotl( i = state(1), shift= a ) , j = state(2) ) , &!
            j => shiftl( i = state(2) , shift = b )                          &!
        )

            generator%state(1) = ieor( i , j )

        end associate

        generator%state(2) = rotl( i = state(2) , shift = c )

    end procedure update_state_core_xoroshiro128



    module procedure update_state_xoroshiro128plus1

        call generator%update_state_core_xoroshiro128( a = 24 , b = 16 , c = 37 )

    end procedure update_state_xoroshiro128plus1



    module procedure update_state_xoroshiro128plus2

        call generator%update_state_core_xoroshiro128( a = 49 , b = 21 , c = 28 )

    end procedure update_state_xoroshiro128plus2



    module procedure update_state_xoroshiro128star2

        call generator%update_state_core_xoroshiro128( a = 24 , b = 16 , c = 37 )

    end procedure update_state_xoroshiro128star2



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
