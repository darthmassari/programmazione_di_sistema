# Tradurre il programma C contenuto nel file "writing_arrays_2_pc.c" in Assembly MIPS32, 
# utilizzando l'indirizzamento indicizzato per accedere agli elementi dell'array.

	.eqv N 10

	.data 10010000

array1: .byte 9,3,0,5,1,12,19,7
array2: .word -5,27,39,-9,-58,3,67,-2,4,9
id1: .word 0
id2: .word 0

	.text
code_start:
#	array1[ 3 ] += 8;
	lw $s1,array1
	lbu $t0,3($s1)
	addu $t0,$t0,8
	sb $t0,3($s1)

#	scanf( "%ld", &id1 );
	li $v0,5
	syscall
	move $t1,$v0

#	array1[ 5 ] = 3 * array1[ id1 ];
	lbu $t0,array1($t1)
	mulu $t0,$t0,3
	sb $t0,5($s1)

#	printf( "%hhx %hhx\n", array1[ 3 ], array1[ 5 ] );
	lw $a0,3($s1)
	li $v0,1
	syscall

	li $a0,5($s1)		#DA VERIFICARE
	li $v0,1
	syscall 

#	array2[ 4 ] = 100 - array2[ 6 ];
	lw $s1,array2
	lw $t0,array1(24)
	li $t6,100
	sub $t6,$t6,$t0
	sw $t6,16($s2)

#	scanf( "%ld", &id2 );
	li $v0,5
	syscall
	move $t2,$v0

#	array2[ id2 ] -= array2[ 3 ];
	lw $t0,12($s2)
	lw $t6,array2($t2)
	sub $t6,$t6,$t0
	sw $t6,array2($t2)

#	printf( "%lx %lx\n", array2[ 4 ], array2[ id2 ] );
	lw $a0,24($s1)
	li $v0,1
	syscall 

	lw $t0,id2
	li $a0,array2($t0)
	li $v0,1
	syscall 

#	return 0;