add_library(
	_xoshiro_fortran
	STATIC
	${CMAKE_CURRENT_SOURCE_DIR}/module.f90
	${CMAKE_CURRENT_SOURCE_DIR}/imp_copy_array.f90
	${CMAKE_CURRENT_SOURCE_DIR}/imp_copy_state.f90
	${CMAKE_CURRENT_SOURCE_DIR}/imp_jump_state_core.f90
	${CMAKE_CURRENT_SOURCE_DIR}/imp_jump_state_long.f90
	${CMAKE_CURRENT_SOURCE_DIR}/imp_jump_state.f90
	${CMAKE_CURRENT_SOURCE_DIR}/imp_output_state.f90
	${CMAKE_CURRENT_SOURCE_DIR}/imp_output_size_state.f90
	${CMAKE_CURRENT_SOURCE_DIR}/imp_random_number_real64.f90
	${CMAKE_CURRENT_SOURCE_DIR}/imp_random_number_scalar_int64.f90
	${CMAKE_CURRENT_SOURCE_DIR}/imp_rotl.f90
	${CMAKE_CURRENT_SOURCE_DIR}/imp_set_state.f90
	${CMAKE_CURRENT_SOURCE_DIR}/imp_transform_to_unit_interval.f90
	${CMAKE_CURRENT_SOURCE_DIR}/imp_update_state.f90
)
