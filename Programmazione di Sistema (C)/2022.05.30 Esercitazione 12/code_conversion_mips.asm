
array1: .byte 9,3,0,5,1,12,19,7

array2: .word -5,27,39,-9,-58,3,67,-2,4,9
id1: .word 6
id2: .word 1

.text
inizio_codice:

# array1[3] += 8;
la $s0,array1
lbu $t0,3($s0)
add $t0,$t0,8
sb $t0,3($s0)

# array1[5] = 3 * array1[id1];
lw $t2,id1
lb $t0,array1($t2)
mul $t0,$t0,3
sb $t0,5($t0)

# array2[4] = 100 - array2[6];
la $s0,array2
lw $t0,24($t0)
li $t1,100
sub $t1,$t1,$t0
sw $t1,16($s0)

# array2[id2] -= array2[3];
lw $t2,id2
mulu $t2,$t2,4
lw $t0,array2($t2)
lw $t1,12($s0)
sub $t0,$t0,$t1
sw $t0,array2($t2)

fine_codice: