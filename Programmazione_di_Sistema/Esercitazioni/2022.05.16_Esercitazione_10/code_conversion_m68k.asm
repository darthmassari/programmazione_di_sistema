org $4000

array1: dc.b 9,3,0,5,1,12,19,7
array2: dc.b -5,27,39,-9,-58,3,67,-2,4,9

id1: dc.l 6
id2: dc.l 3

inizio_codice:

add.b #8,array1+3

move.l #array1,a1
move.l id1,d1
add.l d1,a1

move.w #0,d0
move.b (a1),d0
mulu #3,d0
move.b d0,array1+5