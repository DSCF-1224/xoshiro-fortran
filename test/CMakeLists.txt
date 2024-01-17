cmake_minimum_required(VERSION 3.10)

enable_language(Fortran)

project(test_pkg.exe Fortran)

set(CMAKE_Fortran_FLAGS   "-ffree-line-length-none -fimplicit-none -pedantic -std=f2008 -Wall -Werror -Wextra")
set(CMAKE_Fortran_FLAGS_DEBUG   "-fbacktrace -fbounds-check -g -O0")
set(CMAKE_Fortran_FLAGS_RELEASE "-O2")
set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/fortran-modules)



if (NOT (EXISTS ${CMAKE_Fortran_MODULE_DIRECTORY}/xoshiro_fortran))
	add_subdirectory(
		${CMAKE_CURRENT_SOURCE_DIR}/../src
		${CMAKE_Fortran_MODULE_DIRECTORY}/xoshiro_fortran
	)
endif()



add_executable(${PROJECT_NAME}
	src/xoshiro_test/module.f90
	src/xoshiro_test/test_generator/submodule.f90
	src/xoshiro_test/test_generator/for_0256/submodule.f90
	src/xoshiro_test/test_generator/show_header/submodule.f90
	src/xoshiro_test/test_generator/show_sample/submodule.f90
	src/xoshiro_test/test_generator/show_state/submodule.f90
	src/xoshiro_test/test_generator/show_table_column/submodule.f90
	src/xoshiro_test/test_generator/show_table_header/submodule.f90
	src/main.f90
)



target_link_libraries( ${PROJECT_NAME} PRIVATE _xoshiro_fortran )
