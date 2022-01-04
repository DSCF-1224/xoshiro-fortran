#include "../test_xoshiro256plusplus.h"

int eval_status_fopen ( const int* const status )
{
	switch (*status)
	{
		case EXIT_SUCCESS:

			/* Nothing to do in this scope */
			return EXIT_SUCCESS;
			break;

		case EXIT_FAILURE:

			fprintf( stderr , "%s\n" , "Failed to execute this program." );
			return EXIT_FAILURE;
			break;

		default:

			fprintf( stderr , "%s %d %s\n" , "An unexpected value:" , *status , "was detected." );
			fprintf( stderr , "%s\n"       , "Failed to execute this program." );
			return EXIT_FAILURE;
			break;
	}
}

/* EOF */
