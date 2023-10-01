all: check_dir
	@ifx -c -module include/ src/module.f90
	@ifx -c -module include/ src/*.f90
	@ar rcs libxoshiro256star2.a *.o
	@rm *.o
check_dir:
	@if [ ! -d "include" ]; then \
		mkdir include; \
	fi