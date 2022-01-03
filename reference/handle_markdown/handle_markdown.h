#ifndef HANDLE_MARKDOWN_H_
#define HANDLE_MARKDOWN_H_

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

void print_heading                 ( const size_t const level , const char* const contents );
void print_value_uint64            ( const char* const comment , const size_t* const itr , const uint64_t* const value );
void print_table_header_for_sample ( void );

#endif /* HANDLE_MARKDOWN_H_ */
