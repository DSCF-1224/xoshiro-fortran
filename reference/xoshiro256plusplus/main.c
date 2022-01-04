#include <stdint.h>
#include "test_xoshiro256plusplus.h"

int main (void)
{
	const size_t   size_sample = 10;
	const uint64_t state[]     = { 0 , 0 , 0 , 1 };

	test_xoshiro256plusplus( state , &size_sample );
	return EXIT_SUCCESS;
}

/* EOF */
