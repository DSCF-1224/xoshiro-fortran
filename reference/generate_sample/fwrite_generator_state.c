#include "generate_sample.h"

void fwrite_generator_state_uint64 ( const size_t size_state , const uint64_t* state , FILE* file_ptr_save )
{
	uint32_t size_state_uint32_t = size_state;
	fwrite( &size_state_uint32_t , sizeof(uint32_t) , 1          , file_ptr_save );
	fwrite( state                , sizeof(uint64_t) , size_state , file_ptr_save );
	return;
}

/* EOF */
