submodule (pkg_xoshiro) imp_copy_array

    ! contained <procedure>s, <subroutine>s and <function>s are below
    contains


    module procedure copy_array_int64

        ! support variables for this <procedure>
        integer :: size_min

        ! STEP.01
        size_min = min( size_dst , size_src )

        ! STEP.02
        val_dst(:size_min) = val_src(:size_min)

        ! STEP.END
        return

    end procedure copy_array_int64

end submodule imp_copy_array
