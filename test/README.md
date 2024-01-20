# `C` / `Fortran` mixed test

## How to run this test

### 1. Download following C source files

- [xoshiro/xoroshiro generators and the PRNG shootout](https://prng.di.unimi.it/)
  - [`xoshiro256++`](https://prng.di.unimi.it/xoshiro256plusplus.c) as `xoshiro256plus2_c_interface/xoshiro256plusplus-mod.c`
  - [`xoshiro256**`](https://prng.di.unimi.it/xoshiro256starstar.c) as `xoshiro256plus2_c_interface/xoshiro256starstar-mod.c`

### 2. Add getter/setter for `static` variables in C source files

Add the following two lines to the end of the above source files.

```c
#include "../xoshiro_c_interface/getter.c"
#include "../xoshiro_c_interface/setter.c"
```

### 3. Change the current directory

Go to the folder to test the target PRNG.

- [`xoshiro256plus2`](xoshiro256plus2)
- [`xoshiro256star2`](xoshiro256star2)

### 4. Run the test

Execute the following command.

#### Debug mode

```
./reset_build.sh && cd b* && time cmake -DCMAKE_BUILD_TYPE=Debug .. && time make && time ./test_pkg.exe && cd -
```

#### Release mode

```
./reset_build.sh && cd b* && time cmake -DCMAKE_BUILD_TYPE=Release .. && time make && time ./test_pkg.exe && cd -
```

<!-- EOF -->
