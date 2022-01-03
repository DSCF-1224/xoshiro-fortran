# reference data of `xoshiro256++` #

## Link ##

- [xoshiro/xoroshiro generators and the PRNG shootout](https://prng.di.unimi.it/)
  - [`xoshiro256plusplus.c`](https://prng.di.unimi.it/xoshiro256plusplus.c)

## Result ##

### Without the jump sequence ###

|kind|itr|value|
|:-|-:|:-:|
|state | 0|`0000000000000000`|
|state | 1|`0000000000000000`|
|state | 2|`0000000000000000`|
|state | 3|`0000000000000001`|
|sample| 1|`0000000000800000`|
|sample| 2|`0000000000800011`|
|sample| 3|`0002200000800011`|
|sample| 4|`0002200044000020`|
|sample| 5|`00022000448008a1`|
|sample| 6|`01102100802208a0`|
|sample| 7|`0114002284200880`|
|sample| 8|`0402896644a64095`|
|sample| 9|`8a14a0a244acc891`|
|sample|10|`8c88ba4680b20495`|

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
|sample| 1|`88f9a31afdb439f5`|
|sample| 2|`38134a20dfa1a232`|
|sample| 3|`21d6a25a297797c7`|
|sample| 4|`fca0846cc616d4f8`|
|sample| 5|`1a9d1b267d52627a`|
|sample| 6|`c4345d87063bfe30`|
|sample| 7|`88b7215cc87f6b88`|
|sample| 8|`f5ef8fa1470de5ee`|
|sample| 9|`8aaa468bb80baf3b`|
|sample|10|`7649b52b78bb4634`|

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
|sample| 1|`846af7dbe1fa32be`|
|sample| 2|`1033c1fbb3aec9b2`|
|sample| 3|`d7a4d3aefa68b7bf`|
|sample| 4|`916ac93d3bb30289`|
|sample| 5|`1dd0fadb077421bf`|
|sample| 6|`3c00c4d81e2e2f3e`|
|sample| 7|`60febbed652837c7`|
|sample| 8|`cf8766b88738c6c8`|
|sample| 9|`cb509ecd4383a305`|
|sample|10|`317f541cd8a42896`|

<!-- EOF -->
