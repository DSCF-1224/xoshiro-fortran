#include "generate_sample.h"

void set_state_uint64 ( const size_t size_state , uint64_t* dst , const uint64_t src[] )
{
	for (size_t i = 0; i < size_state; i++)
	{
		dst[i] = src[i];
	}
	
	return;
}

/* EOF */
