#ifndef GENERATE_SAMPLE_H_
#define GENERATE_SAMPLE_H_

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define filepath_without_jump   "../result/without_jump.bin"
#define filepath_with_jump      "../result/with_jump.bin"
#define filepath_with_long_jump "../result/with_long_jump.bin"

FILE* file_ptr_without_jump;
FILE* file_ptr_with_jump;
FILE* file_ptr_with_long_jump;

int fclose_save_samples ( void );
int fopen_save_samples  ( void );

void fwrite_generator_state_uint64 ( const size_t size_state , const uint64_t* state , FILE* file_ptr_save );
void set_state_uint64              ( const size_t size_state , uint64_t* dst , const uint64_t src[] );

#endif /* GENERATE_SAMPLE_H_ */
