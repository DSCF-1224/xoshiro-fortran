#include "handle_markdown.h"


void print_heading_symbol ( const size_t* const level , const bool const is_fore )
{
	// STEP.01
	if ( is_fore ) printf( "\n" );

	// STEP.02
	if ( !is_fore ) printf( "%1s" , " " );

	// STEP.03
	for (size_t i = 0; i < *level; i++) printf( "%1s" , "#" );

	// STEP.04
	if ( is_fore ) printf( "%1s" , " " );

	// STEP.05
	if ( !is_fore ) printf( "\n\n" );

	// STEP.TRUE_END
	return;
}


void print_heading ( const size_t const level , const char* const contents )
{
	// STEP.01
	print_heading_symbol( &level , true );

	// STEP.02
	printf( "%s" , contents );

	// STEP.03
	print_heading_symbol( &level , false );

	// STEP.TRUE_END
	return;
}

/* EOF */
