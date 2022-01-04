#include "generate_sample.h"

int fclose_save_samples ( void )
{
	// STEP.01
	fclose( file_ptr_without_jump   );
	fclose( file_ptr_with_jump      );
	fclose( file_ptr_with_long_jump );

	// STEP.TRUE_END
	return EXIT_SUCCESS;
}

/* EOF */
