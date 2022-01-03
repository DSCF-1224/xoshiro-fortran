# test data of `xoshiro-fortran` #

## Table of Contents ##

- [Result](#Result)

## Result ##

## Result &colon; `xoshiro256++` ##

#### without jump of the generator state ####

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
|sample| 5|`00022000448008A1`|
|sample| 6|`01102100802208A0`|
|sample| 7|`0114002284200880`|
|sample| 8|`0402896644A64095`|
|sample| 9|`8A14A0A244ACC891`|
|sample|10|`8C88BA4680B20495`|

#### with a jump of the generator state ####

|kind|itr|value|
|:-|-:|:-:|
|state | 0|`0000000000000000`|
|state | 1|`0000000000000000`|
|state | 2|`0000000000000000`|
|state | 3|`0000000000000001`|
|state | 0|`934D05E8B2076310`|
|state | 1|`EABDD0BF76A1BE51`|
|state | 2|`75DD6A992ACCB1E8`|
|state | 3|`C660C602A7330187`|
|sample| 1|`88F9A31AFDB439F5`|
|sample| 2|`38134A20DFA1A232`|
|sample| 3|`21D6A25A297797C7`|
|sample| 4|`FCA0846CC616D4F8`|
|sample| 5|`1A9D1B267D52627A`|
|sample| 6|`C4345D87063BFE30`|
|sample| 7|`88B7215CC87F6B88`|
|sample| 8|`F5EF8FA1470DE5EE`|
|sample| 9|`8AAA468BB80BAF3B`|
|sample|10|`7649B52B78BB4634`|

#### with a jump of the generator state ####

|kind|itr|value|
|:-|-:|:-:|
|state | 0|`0000000000000000`|
|state | 1|`0000000000000000`|
|state | 2|`0000000000000000`|
|state | 3|`0000000000000001`|
|state | 0|`4AA11F0B3241CDBF`|
|state | 1|`B6A17239B35B197F`|
|state | 2|`504952572E3F844B`|
|state | 3|`2628DF68616FD3A0`|
|sample| 1|`846AF7DBE1FA32BE`|
|sample| 2|`1033C1FBB3AEC9B2`|
|sample| 3|`D7A4D3AEFA68B7BF`|
|sample| 4|`916AC93D3BB30289`|
|sample| 5|`1DD0FADB077421BF`|
|sample| 6|`3C00C4D81E2E2F3E`|
|sample| 7|`60FEBBED652837C7`|
|sample| 8|`CF8766B88738C6C8`|
|sample| 9|`CB509ECD4383A305`|
|sample|10|`317F541CD8A42896`|

<!-- EOF -->
