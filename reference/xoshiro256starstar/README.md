# reference data of `xoshiro256**` #

## Link ##

- [xoshiro/xoroshiro generators and the PRNG shootout](https://prng.di.unimi.it/)
  - [`xoshiro256starstar.c`](https://prng.di.unimi.it/xoshiro256starstar.c)

## Result ##

### Result &colon; `xoshiro256**` ###

### Without the jump sequence ###

|kind|itr|value|
|:-|-:|:-:|
|state | 0|`0000000000000000`|
|state | 1|`0000000000000000`|
|state | 2|`0000000000000000`|
|state | 3|`0000000000000001`|
|sample| 1|`0000000000000000`|
|sample| 2|`0000000000000000`|
|sample| 3|`0000000000001680`|
|sample| 4|`02d0000000001680`|
|sample| 5|`02d0005a2d001680`|
|sample| 6|`0000005a2d0b4120`|
|sample| 7|`68b45a5a2d0b57a0`|
|sample| 8|`68b48716ad000120`|
|sample| 9|`1cb48716b2a00288`|
|sample|10|`11b10070bdeb59bc`|

### Used `jump()` ###

|kind|itr|value|
|:-|-:|:-:|
|state | 0|`0000000000000000`|
|state | 1|`0000000000000000`|
|state | 2|`0000000000000000`|
|state | 3|`0000000000000001`|
|state | 0|`934d05e8b2076310`|
|state | 1|`eabdd0bf76a1be51`|
|state | 2|`75dd6a992accb1e8`|
|state | 3|`c660c602a7330187`|
|sample| 1|`aed8d3ed373a211a`|
|sample| 2|`055baff45a8cdb8e`|
|sample| 3|`4f99e3c7b7aa48f2`|
|sample| 4|`36634b1d710c7653`|
|sample| 5|`f9660f773c654151`|
|sample| 6|`6d5b9d0ca69a4a72`|
|sample| 7|`13c137b2c8a18efa`|
|sample| 8|`8f201fdd0471f897`|
|sample| 9|`a17a56c3464c3f89`|
|sample|10|`101e70c7c75f6456`|

### Used `long_jump()` ###

|kind|itr|value|
|:-|-:|:-:|
|state | 0|`0000000000000000`|
|state | 1|`0000000000000000`|
|state | 2|`0000000000000000`|
|state | 3|`0000000000000001`|
|state | 0|`4aa11f0b3241cdbf`|
|state | 1|`b6a17239b35b197f`|
|state | 2|`504952572e3f844b`|
|state | 3|`2628df68616fd3a0`|
|sample| 1|`308a124381bdac08`|
|sample| 2|`70126fe4c794391e`|
|sample| 3|`07a9c118caa5bc86`|
|sample| 4|`aea320c3afdfd7ea`|
|sample| 5|`2ccce0c2e769287f`|
|sample| 6|`ecf4314d67b23e09`|
|sample| 7|`a7db7c5361e3365f`|
|sample| 8|`ee3cef53433dcd59`|
|sample| 9|`ec2fb631539bb5ed`|
|sample|10|`19ebce0921470ca1`|

<!-- EOF -->
