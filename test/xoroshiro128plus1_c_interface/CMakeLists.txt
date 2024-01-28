if (NOT (EXISTS ${CMAKE_Fortran_MODULE_DIRECTORY}/xoshiro_c_interface))
	add_subdirectory(
		${CMAKE_CURRENT_SOURCE_DIR}/../xoshiro_c_interface
		${CMAKE_Fortran_MODULE_DIRECTORY}/xoshiro_c_interface
	)
endif()



add_library(
	_xoroshiro128plus1_c_interface
	STATIC
	${CMAKE_CURRENT_SOURCE_DIR}/xoroshiro128plus-mod.c
	${CMAKE_CURRENT_SOURCE_DIR}/module.f90
)



target_link_libraries( _xoroshiro128plus1_c_interface PRIVATE _xoshiro_c_interface )

# EOF
