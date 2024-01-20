module pkg_xoshiro_test

    use ,     intrinsic :: iso_fortran_env         , only: int64
    use , non_intrinsic :: pkg_xoshiro             , only: typ_generator64_base
    use , non_intrinsic :: pkg_xoshiro_c_interface , only: typ_generator64_c_base



    implicit none



    private
    public  :: execute_test



    contains



    subroutine execute_test ( prng_c , prng_fortran , prng_name , sample_size )

        class(typ_generator64_c_base), intent(in) :: prng_c
        !! A dummy argument for this `SUBROUTINE`

        class(typ_generator64_base), intent(inout) :: prng_fortran
        !! A dummy argument for this `SUBROUTINE`

        character( len=* ), intent(in) :: prng_name
        !! A dummy argument for this `SUBROUTINE`

        integer, intent(in) :: sample_size
        !! A dummy argument for this `SUBROUTINE`



        integer(int64) , dimension(sample_size) :: harvest_c
        !! A variable for this `SUBROUTINE`
        !! buffer of the harvest from C

        integer(int64) , dimension(sample_size) :: harvest_fortran
        !! A variable for this `SUBROUTINE`
        !! buffer of the harvest from Fortran



        integer :: write_unit
        !! A support variable for this `SUBROUTINE`



        open( &!
            newunit = write_unit     , &!
            file    = '../README.md' , &!
            action  = 'write'        , &!
            form    = 'formatted'    , &!
            status  = 'unknown'        &!
        )



        write( unit=write_unit, fmt='(A,"`",A,"`")' ) '# C/Fortran mixed test :', prng_name



        before_jump: &!
        block

            call set_seed( &!
                state_size   = prng_fortran%output_state_size() , &!
                prng_c       = prng_c                           , &!
                prng_fortran = prng_fortran                       &!
            )



            call write_table_header( write_unit , 'No `jump`' )



            call execute_test_core( &!
                prng_c          = prng_c             , &!
                prng_fortran    = prng_fortran       , &!
                write_unit      = write_unit         , &!
                sample_size     = sample_size        , &!
                harvest_c       = harvest_c(:)       , &!
                harvest_fortran = harvest_fortran(:)   &!
            )

        end block &!
        before_jump



        using_jump: &!
        block

            call write_table_header( write_unit , 'Using `jump`' )



            call set_seed( &!
                state_size   = prng_fortran%output_state_size() , &!
                prng_c       = prng_c                           , &!
                prng_fortran = prng_fortran                       &!
            )



            call write_state( &!
                state_size   = prng_fortran%output_state_size() , &!
                write_unit   = write_unit                       , &!
                prng_c       = prng_c                           , &!
                prng_fortran = prng_fortran                       &!
            )



            call prng_c       % jump_state()
            call prng_fortran % jump_state()

            write( unit=write_unit, fmt='("|",A,"|")' ) 'jump'



            call execute_test_core( &!
                prng_c          = prng_c             , &!
                prng_fortran    = prng_fortran       , &!
                write_unit      = write_unit         , &!
                sample_size     = sample_size        , &!
                harvest_c       = harvest_c(:)       , &!
                harvest_fortran = harvest_fortran(:)   &!
            )

        end block &!
        using_jump



        using_long_jump: &!
        block

            call write_table_header( write_unit , 'Using `long_jump`' )



            call set_seed( &!
                state_size   = prng_fortran%output_state_size() , &!
                prng_c       = prng_c                           , &!
                prng_fortran = prng_fortran                       &!
            )



            call write_state( &!
                state_size   = prng_fortran%output_state_size() , &!
                write_unit   = write_unit                       , &!
                prng_c       = prng_c                           , &!
                prng_fortran = prng_fortran                       &!
            )



            call prng_c       % jump_state_long()
            call prng_fortran % jump_state_long()

            write( unit=write_unit, fmt='("|",A,"|")' ) 'long_jump'



            call execute_test_core( &!
                prng_c          = prng_c             , &!
                prng_fortran    = prng_fortran       , &!
                write_unit      = write_unit         , &!
                sample_size     = sample_size        , &!
                harvest_c       = harvest_c(:)       , &!
                harvest_fortran = harvest_fortran(:)   &!
            )

        end block &!
        using_long_jump



        write( unit=write_unit, fmt='(A)' ) new_line('') // '<!-- EOF -->'



        close(write_unit)



        print '("SUCCESS:",1X,A)' , prng_name

    end subroutine execute_test



    subroutine execute_test_core ( prng_c, prng_fortran, write_unit, sample_size, harvest_c, harvest_fortran )

        class(typ_generator64_c_base), intent(in) :: prng_c
        !! A dummy argument for this `SUBROUTINE`

        class(typ_generator64_base), intent(inout) :: prng_fortran
        !! A dummy argument for this `SUBROUTINE`

        integer, intent(in) :: write_unit
        !! A dummy argument for this `SUBROUTINE`

        integer, intent(in) :: sample_size
        !! A dummy argument for this `SUBROUTINE`

        integer(int64) , dimension(sample_size) , intent(inout) :: harvest_c
        !! A dummy argument for this `SUBROUTINE`
        !! buffer of the harvest from C

        integer(int64) , dimension(sample_size) , intent(inout) :: harvest_fortran
        !! A dummy argument for this `SUBROUTINE`
        !! buffer of the harvest from Fortran



        logical, dimension( prng_fortran%output_state_size() ) :: is_not_equal
        !! A support variable for this `SUBROUTINE`

        integer :: i
        !! A support variable for this `SUBROUTINE`



        call write_state( &!
            state_size   = prng_fortran%output_state_size() , &!
            write_unit   = write_unit                       , &!
            prng_c       = prng_c                           , &!
            prng_fortran = prng_fortran                       &!
        )



        do i = 1, prng_fortran%output_state_size()

            associate( &!
                state_c       => prng_c       % output_state(i) , &!
                state_fortran => prng_fortran % output_state(i)   &!
            )

                is_not_equal(i) = ( state_c .ne. state_fortran )

            end associate

        end do



        if ( any( is_not_equal(:) ) ) then
            error stop ":The state is not equal."
        end if



        do i = 1, sample_size

            call prng_c       % random_number( harvest_c       (i) )
            call prng_fortran % random_number( harvest_fortran (i) )

            write( unit=write_unit, fmt='("|sample|",I0,2("|`0x",Z16.16,"`"),"|")' ) i, harvest_c(i), harvest_fortran(i)

        end do



        if ( any( harvest_c(:) .ne. harvest_fortran(:) ) ) then
            error stop ":The harvests are not equal."
        end if

    end subroutine execute_test_core



    subroutine set_seed ( state_size , prng_c , prng_fortran )

        integer , intent(in) :: state_size
        !! A dummy argument for this `SUBROUTINE`

        class(typ_generator64_c_base), intent(in) :: prng_c
        !! A dummy argument for this `SUBROUTINE`

        class(typ_generator64_base), intent(inout) :: prng_fortran
        !! A dummy argument for this `SUBROUTINE`



        integer(int64) , dimension(state_size) :: seed
        !! A variable for this `SUBROUTINE`



        integer :: i
        !! A support variable for this `SUBROUTINE`



        seed(:         ) = 0_int64
        seed(state_size) = 1_int64

        call prng_fortran % set_state( seed(:) )

        do i = 1, state_size
            call prng_c%set_state( i, seed(i) )
        end do

    end subroutine set_seed



    subroutine write_state ( write_unit , state_size , prng_c , prng_fortran )

        integer , intent(in) :: write_unit
        !! A dummy argument for this `SUBROUTINE`

        integer , intent(in) :: state_size
        !! A dummy argument for this `SUBROUTINE`

        class(typ_generator64_c_base), intent(in) :: prng_c
        !! A dummy argument for this `SUBROUTINE`

        class(typ_generator64_base), intent(inout) :: prng_fortran
        !! A dummy argument for this `SUBROUTINE`



        integer :: i
        !! A support variable for this `SUBROUTINE`



        do i = 1, state_size

            write( unit=write_unit, fmt='("|state|",I0,2("|`0x",Z16.16,"`"),"|")' ) &!
            i                              , &!
            prng_c       % output_state(i) , &!
            prng_fortran % output_state(i)

        end do

    end subroutine write_state



    subroutine write_table_header ( write_unit , header2 )

        integer , intent(in) :: write_unit
        !! A dummy argument for this `SUBROUTINE`

        character( len=* ) , intent(in) :: header2
        !! A dummy argument for this `SUBROUTINE`



        write( unit=write_unit, fmt='(A)' ) ! BLANK LINE
        write( unit=write_unit, fmt='(A)' ) '## ' // header2
        write( unit=write_unit, fmt='(A)' ) ! BLANK LINE
        write( unit=write_unit, fmt='(A)' ) '|kind|iter|value (C)|value (F)|'
        write( unit=write_unit, fmt='(A)' ) '|:--:|---:|:-------:|:-------:|'

    end subroutine write_table_header

end module pkg_xoshiro_test
