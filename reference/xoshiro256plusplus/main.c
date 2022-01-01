#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "xoshiro256plusplus.c"


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
	for (size_t i = 1; i <= count; i++)
	{
		printf( "%6s %2lu %20.20lu\n" , "sample" , i , next() );
	}

	return;
}


void show_state ( void )
{
	for (size_t i = 0; i < sizeof s / sizeof *s; i++)
	{
		printf( "%6s %2lu %20.20lu\n" , "state" , (i + 1) , s[i] );
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
	// STEP.01
	printf                ( "\nseed= %lu %lu %lu %lu\n" , s0 , s1 , s2 , s3 );
	set_engine            ( s0 , s1 , s2 , s3 );
	test_rand_engine_unit ();

	// STEP.02
	printf                ( "\n%s\n" , "Used `jump()`" );
	set_engine            ( s0 , s1 , s2 , s3 );
	jump                  ();
	test_rand_engine_unit ();

	// STEP.03
	printf                ( "\n%s\n" , "Used `long_jump()`" );
	set_engine            ( s0 , s1 , s2 , s3 );
	long_jump             ();
	test_rand_engine_unit ();

	// STEP.END
	return;

}


int main (void) {

	test_rand_engine( 0 , 0 , 0 , 1 );
	test_rand_engine( 0 , 0 , 1 , 0 );
	test_rand_engine( 0 , 1 , 0 , 0 );
	test_rand_engine( 1 , 0 , 0 , 0 );
	return EXIT_SUCCESS;

}
