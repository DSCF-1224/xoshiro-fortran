cmake_minimum_required(VERSION 3.10)

project(test_xoshiro256p2)

set(CMAKE_CXX_FLAG         "-Wall -Werror -Wextra")
set(CMAKE_CXX_FLAG_DEBUG   "-O0")
set(CMAKE_CXX_FLAG_RELEASE "-O2")

add_executable(${PROJECT_NAME}
	../../generate_sample/eval_status_fclose.c
	../../generate_sample/eval_status_fopen.c
	../../generate_sample/fclose_save_samples.c
	../../generate_sample/fopen_save_samples.c
	../../generate_sample/fwrite_generator_state.c
	../../generate_sample/set_state.c
	../../handle_markdown/print_heading.c
	../../handle_markdown/print_table.c
	../../handle_markdown/print_value.c
	../test_xoshiro256plusplus.c
	../main.c
)
