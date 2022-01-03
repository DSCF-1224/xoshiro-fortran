#include "handle_markdown.h"

void print_value_uint64 ( const char* const comment , const size_t* const itr , const uint64_t* const value )
{
	printf( "|%6s|%2lu|`%16.16lx`|\n" , comment , *itr , *value );
	return;
}

/* EOF */
