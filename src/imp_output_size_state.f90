submodule (pkg_xoshiro) imp_output_size_state

    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure output_size_state

        if ( default ) then

            select type ( generator )
                type is       ( typ_xoshiro256plus2 ) ; size_state = size_state_xoshiro256plus2
                type is       ( typ_xoshiro256star2 ) ; size_state = size_state_xoshiro256star2
                class default                         ; size_state = 0
            end select

        else

            if   ( allocated( generator%state ) ) then ; size_state = size( generator%state(:) )
            else                                       ; size_state = 0
            end if

        end if

    end procedure output_size_state

end submodule imp_output_size_state
