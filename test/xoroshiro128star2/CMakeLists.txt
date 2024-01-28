cmake_minimum_required(VERSION 3.10)

enable_language(C Fortran)

project(test_pkg.exe Fortran)

set(CMAKE_C_COMPILER               "gcc")
set(CMAKE_C_FLAGS                  "-Wall -Wextra")
set(CMAKE_C_FLAGS_DEBUG            "-g -O0")
set(CMAKE_Fortran_FLAGS            "-Wall -Wextra")
set(CMAKE_Fortran_FLAGS_DEBUG      "-fbacktrace -fbounds-check -g -O0")
set(CMAKE_Fortran_FLAGS_RELEASE    "-O2")
set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/fortran-modules)



if (NOT (EXISTS ${CMAKE_Fortran_MODULE_DIRECTORY}/xoshiro_fortran))
	add_subdirectory(
		${CMAKE_CURRENT_SOURCE_DIR}/../../src
		${CMAKE_Fortran_MODULE_DIRECTORY}/xoshiro_fortran
	)
endif()



if (NOT (EXISTS ${CMAKE_Fortran_MODULE_DIRECTORY}/xoshiro_test))
	add_subdirectory(
		${CMAKE_CURRENT_SOURCE_DIR}/../xoshiro_test
		${CMAKE_Fortran_MODULE_DIRECTORY}/xoshiro_test
	)
endif()



if (NOT (EXISTS ${CMAKE_Fortran_MODULE_DIRECTORY}/xoroshiro128star2_c_interface))
	add_subdirectory(
		${CMAKE_CURRENT_SOURCE_DIR}/../xoroshiro128star2_c_interface
		${CMAKE_Fortran_MODULE_DIRECTORY}/xoroshiro128star2_c_interface
	)
endif()



add_executable(${PROJECT_NAME}
	${CMAKE_CURRENT_SOURCE_DIR}/main.f90
)



target_link_libraries( ${PROJECT_NAME} PRIVATE _xoshiro_fortran               )
target_link_libraries( ${PROJECT_NAME} PRIVATE _xoshiro_test                  )
target_link_libraries( ${PROJECT_NAME} PRIVATE _xoroshiro128star2_c_interface )

# EOF
