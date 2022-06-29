org $4000

array1: dc.b 9,3,0,5,1,12,19,7

array2: dc.l -5,27,39,-9,-58,3,67,-2,4,9
id1: dc.l 6
id2: dc.l 1

org $2000
inizio_codice:

* array1[3] += 8;
move.l #array1,a1
add.b #8,3(a1)

* array1[5] = 3 * array1[id1];
move.l id1,d1
move.l #0,d0
move.b (a1,d1.l),d0
mulu #3,d0
move.b d0,5(a1)

* array2[4] = 100 - array2[6];
move.l #array2,a2
move.l #100,d0
sub.l 24(a2),d0
move.l d0,16(a2)

* array2[id2] -= array2[3];
move.l 12(a2),d0	;array2 è già stato spostato in a2
move.l id2,d1
mulu #4,d1
sub.l d0,(a2,d1.l)

fine_codice: