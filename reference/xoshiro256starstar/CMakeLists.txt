cmake_minimum_required(VERSION 3.10)

project(test_xoshiro256s2)

set(CMAKE_CXX_FLAG         "-Wall -Werror -Wextra")
set(CMAKE_CXX_FLAG_DEBUG   "-O0")
set(CMAKE_CXX_FLAG_RELEASE "-O2")

add_executable(${PROJECT_NAME}
	../../handle_markdown/print_heading.c
	../../handle_markdown/print_table.c
	../../handle_markdown/print_value.c
	../main.c
)
