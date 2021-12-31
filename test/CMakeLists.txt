cmake_minimum_required(VERSION 3.10)

enable_language(Fortran)

project(test_pkg.exe Fortran)

set(CMAKE_Fortran_FLAGS   "-ffree-line-length-none -fimplicit-none -pedantic -std=f2008 -Wall -Werror -Wextra")
set(CMAKE_Fortran_FLAGS_DEBUG   "-fbacktrace -fbounds-check -g -O0")
set(CMAKE_Fortran_FLAGS_RELEASE "-O2")

add_executable(${PROJECT_NAME}
	../src/module.f90
	../src/imp_allocate_state.f90
	../src/imp_copy_state.f90
	../src/imp_deallocate_state.f90
	../src/imp_jump_state_core.f90
	../src/imp_jump_state_long.f90
	../src/imp_jump_state.f90
	../src/imp_random_number_sclr_int64.f90
	../src/imp_random_number_sclr_real64.f90
	../src/imp_rotl.f90
	../src/imp_set_state.f90
	../src/imp_show_state.f90
	../src/imp_transform_to_unit_interval.f90
	../src/imp_update_state.f90
	../src/main.f90
)
