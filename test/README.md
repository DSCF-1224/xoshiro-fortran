# `C` / `Fortran` mixed test

## How to run this test

### 1. Download following C source files

- [xoshiro/xoroshiro generators and the PRNG shootout](https://prng.di.unimi.it/)
  - [`xoroshiro128+`](https://prng.di.unimi.it/xoroshiro128plus.c) as `xoroshiro128plus2_c_interface/xoroshiro128plus-mod.c`
  - [`xoroshiro128++`](https://prng.di.unimi.it/xoroshiro128plusplus.c) as `xoroshiro128plus2_c_interface/xoroshiro128plusplus-mod.c`
  - [`xoroshiro128**`](https://prng.di.unimi.it/xoroshiro128starstar.c) as `xoroshiro128plus2_c_interface/xoroshiro128starstar-mod.c`
  - [`xoshiro256+`](https://prng.di.unimi.it/xoshiro256plus.c) as `xoshiro256plus2_c_interface/xoshiro256plus-mod.c`
  - [`xoshiro256++`](https://prng.di.unimi.it/xoshiro256plusplus.c) as `xoshiro256plus2_c_interface/xoshiro256plusplus-mod.c`
  - [`xoshiro256**`](https://prng.di.unimi.it/xoshiro256starstar.c) as `xoshiro256plus2_c_interface/xoshiro256starstar-mod.c`
  - [`xoshiro512+`](https://prng.di.unimi.it/xoshiro512plus.c) as `xoshiro512plus2_c_interface/xoshiro512plus-mod.c`
  - [`xoshiro512++`](https://prng.di.unimi.it/xoshiro512plusplus.c) as `xoshiro512plus2_c_interface/xoshiro512plusplus-mod.c`
  - [`xoshiro512**`](https://prng.di.unimi.it/xoshiro512starstar.c) as `xoshiro512plus2_c_interface/xoshiro512starstar-mod.c`

### 2. Add getter/setter for `static` variables in C source files

Add the following two lines to the end of the above source files.

```c
#include "../xoshiro_c_interface/getter.c"
#include "../xoshiro_c_interface/setter.c"
```

### 3. Change the current directory

Go to the folder to test the target PRNG.

- [`xoroshiro128plus1`](xoroshiro128plus1)
- [`xoroshiro128plus2`](xoroshiro128plus2)
- [`xoroshiro128star2`](xoroshiro128star2)
- [`xoshiro256plus1`](xoshiro256plus1)
- [`xoshiro256plus2`](xoshiro256plus2)
- [`xoshiro256star2`](xoshiro256star2)
- [`xoshiro512plus1`](xoshiro512plus1)
- [`xoshiro512plus2`](xoshiro512plus2)
- [`xoshiro512star2`](xoshiro512star2)

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
