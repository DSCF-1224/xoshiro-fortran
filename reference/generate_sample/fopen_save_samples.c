#include "generate_sample.h"

/* function prototypes */
bool status_fopen ( const FILE* const file_ptr );


/* implementations */
bool status_fopen ( const FILE* const file_ptr )
{
	return !( file_ptr == NULL );
}

int fopen_save_samples ( void )
{
	// STEP.01
	// Try to open files to save generated samples.
	file_ptr_without_jump   = fopen( filepath_without_jump   , "wb" );
	file_ptr_with_jump      = fopen( filepath_with_jump      , "wb" );
	file_ptr_with_long_jump = fopen( filepath_with_long_jump , "wb" );

	// STEP.02
	// Check the status of the `fopen`
	if ( !status_fopen( file_ptr_without_jump ) )
	{
		fprintf( stderr , "Failed to open a file: %s\n" , filepath_without_jump );
		return EXIT_FAILURE;
	}

	if ( !status_fopen( file_ptr_with_jump ) )
	{
		fprintf( stderr , "Failed to open a file: %s\n" , filepath_with_jump );
		return EXIT_FAILURE;
	}

	if ( !status_fopen( file_ptr_with_long_jump ) )
	{
		fprintf( stderr , "Failed to open a file: %s\n" , filepath_with_long_jump );
		return EXIT_FAILURE;
	}

	// STEP.TRUE_END
	return EXIT_SUCCESS;
}

/* EOF */
