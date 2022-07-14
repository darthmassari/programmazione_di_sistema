* Tradurre il programma C contenuto nel file "writing_arrays_2_pc.c" in Assembly MC68000, 
* utilizzando l'indirizzamento indicizzato per accedere agli elementi dell'array.

N equ 10

	org $4000

array1: dc.b 9,3,0,5,1,12,19,7
array2: dc.l -5,27,39,-9,-58,3,67,-2,4,9
id1: dc.l 0
id2: dc.l 0

	org $2000
code_start:
;	array1[ 3 ] += 8;
	move.l #array1,a1
	add.b 8,3(a1)

;	scanf( "%ld", &id1 );
	move.l 5,id1	;SIMULATO

;	array1[ 5 ] = 3 * array1[ id1 ];
	move.l #id1,d1
	move.b d1(a1),d0
	mulu 3,d0
	move.b d0,5(a1)

;	printf( "%hhx %hhx\n", array1[ 3 ], array1[ 5 ] );
	move.b 3(a1),a0	;SIMULATO
	move.b 5(a1),a0	;SIMULATO

;	array2[ 4 ] = 100 - array2[ 6 ];
	move.l #array2,a2
	move.l #100,d0
	sub.l 6(a2),d0
	move.l d0,4(a2)

;	scanf( "%ld", &id2 );
	move.l 6,id2	;SIMULATO

;	array2[ id2 ] -= array2[ 3 ];		
	move.l 3(a2),d0
	move.l #id2,d1
	move.l d1(a2),d2
	sub.l d0,d2
	move.l d0,d1(a2)

;	printf( "%lx %lx\n", array2[ 4 ], array2[ id2 ] );
	move.l 4(a2),a0
	move.l d1(a2),a0

;	return 0;
	end