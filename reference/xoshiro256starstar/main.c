#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "xoshiro256starstar.c"
#include "../handle_markdown/handle_markdown.h"


void set_engine ( const uint64_t s0 , const uint64_t s1 , const uint64_t s2 , const uint64_t s3 )
{
	s[0] = s0;
	s[1] = s1;
	s[2] = s2;
	s[3] = s3;
	return;
}


void show_next ( const size_t count )
{
	const char comment[6] = "sample";

	for (size_t i = 1; i <= count; i++)
	{
		const uint64_t buffer = next();
		print_value_uint64( comment , &i , &buffer );
	}

	return;
}


void show_state ( void )
{
	const char comment[6] = "state ";

	for (size_t i = 0; i < sizeof s / sizeof *s; i++)
	{
		print_value_uint64( comment , &i , &s[i] );
	}

	return;
}


void test_rand_engine_unit ( void )
{
	show_state ();
	show_next  ( 10 );
	return;
}


void test_rand_engine ( const uint64_t s0 , const uint64_t s1 , const uint64_t s2 , const uint64_t s3 )
{
	const size_t level_heading = 3;

	// STEP.01
	print_heading                 ( level_heading , "Without the jump sequence" );
	set_engine                    ( s0 , s1 , s2 , s3 );
	print_table_header_for_sample ();
	test_rand_engine_unit ();

	// STEP.02
	print_heading                 ( level_heading , "Used `jump()`" );
	set_engine                    ( s0 , s1 , s2 , s3 );
	print_table_header_for_sample ();
	show_state                    ();
	jump                          ();
	test_rand_engine_unit         ();

	// STEP.03
	print_heading                 ( level_heading , "Used `long_jump()`" );
	set_engine                    ( s0 , s1 , s2 , s3 );
	print_table_header_for_sample ();
	show_state                    ();
	long_jump                     ();
	test_rand_engine_unit         ();

	// STEP.END
	return;

}


int main (void) {

	test_rand_engine( 0 , 0 , 0 , 1 );
	return EXIT_SUCCESS;

}
