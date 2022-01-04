#include "test_xoshiro256plusplus.h"
#include "../original/xoshiro256plusplus.c"


void fwrite_sample ( const size_t* const size_sample , FILE* file_ptr_save )
{
	// STEP.01
	// Write the number of samples to save.
	uint32_t size_sample_uint32_t = *size_sample;
	fwrite( &size_sample_uint32_t , sizeof(uint32_t) , 1 , file_ptr_save );

	// STEP.02
	// Write the generates samples.
	for (size_t i = 0; i < *size_sample; i++)
	{
		const uint64_t buffer = next();
		fwrite( &buffer , sizeof(uint64_t) , 1 , file_ptr_save );
	}

	// STEP.END
	return;
}


int test_xoshiro256plusplus ( const uint64_t* const state , const size_t* const size_sample )
{
	// STEP.01
	// Open files to save generated samples.
	int status_fopen = fopen_save_samples();

	if ( eval_status_fopen(&status_fopen) == EXIT_FAILURE )
	{
		return EXIT_FAILURE;
	}


	// STEP.02
	// Generate the samples using `xoshiro256++`
	set_state_uint64              ( size_state  , s , state );
	fwrite_generator_state_uint64 ( size_state  , s , file_ptr_without_jump );
	fwrite_sample                 ( size_sample ,     file_ptr_without_jump );

	set_state_uint64              ( size_state  , s , state );
	jump                          ();
	fwrite_generator_state_uint64 ( size_state  , s , file_ptr_with_jump );
	fwrite_sample                 ( size_sample ,    file_ptr_with_jump );

	set_state_uint64              ( size_state  , s , state );
	long_jump                     ();
	fwrite_generator_state_uint64 ( size_state  , s , file_ptr_with_long_jump );
	fwrite_sample                 ( size_sample ,    file_ptr_with_long_jump );



	// STEP.03
	// Close files to save generated samples.
	int status_fclose = fclose_save_samples();

	if ( eval_status_fopen(&status_fclose) == EXIT_FAILURE )
	{
		return EXIT_FAILURE;
	}


	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
