#ifndef TEST_XOSHIRO256PLUSPLUS_H_
#define TEST_XOSHIRO256PLUSPLUS_H_

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "../generate_sample/generate_sample.h"
#include "../handle_markdown/handle_markdown.h"

#define size_state 4

int eval_status_fclose      ( const int* const status );
int eval_status_fopen       ( const int* const status );
int test_xoshiro256plusplus ( const uint64_t* const state , const size_t* const size_sample );

#endif /* TEST_XOSHIRO256PLUSPLUS_H_ */
