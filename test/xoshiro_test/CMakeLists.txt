if (NOT (EXISTS ${CMAKE_Fortran_MODULE_DIRECTORY}/xoshiro_c_interface))
	add_subdirectory(
		${CMAKE_CURRENT_SOURCE_DIR}/../xoshiro_c_interface
		${CMAKE_Fortran_MODULE_DIRECTORY}/xoshiro_c_interface
	)
endif()



add_library(
	_xoshiro_test
	STATIC
	${CMAKE_CURRENT_SOURCE_DIR}/module.f90
)



target_link_libraries( _xoshiro_test PRIVATE _xoshiro_c_interface )

# EOF
