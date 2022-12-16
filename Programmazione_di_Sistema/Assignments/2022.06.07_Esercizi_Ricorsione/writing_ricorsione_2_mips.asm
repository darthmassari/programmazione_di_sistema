# Si scriva un programma con le seguenti caratteristiche:
# ◦ La procedura principale del programma esegue le seguenti azioni:
# 	◦ Per ciascun intero K maggiore o uguale a 0 e minore di 1000, 
#	  chiama la procedura FR2 con parametro K e memorizza il risultato nella posizione K di un array
# ◦ La procedura FR2 deve calcolare, in modo ricorsivo, il risultato della funzione F(x), 
#	che ha un parametro intero e produce un risultato intero, definita come:
# 	◦ F( x ) = 0 se x <= 0
#	◦ F( x ) = x -( 3 * F( x -1 )) se x > 0

# Realizzare 3 versioni del programma, che soddisfino i seguenti requisiti:
# 3 Versione ASM MIPS32-MARS

# Versione C
#	int fr2 ( int x ){
#		if( x <= 0 )
#			return 0;
#		return x -( 3 * fr2( x - 1 ));
#	}
#	
#	int k;
#	int array[1000];
#	
#	int main (void) {
#		for ( int i = 0; 0<=k<1000; i++ ) { 
#			printf("Inserisci un numero intero: ");
#			scanf("%d", &k);
#			array[ k ] = fr2( k );
#		}
#	}

	.data
a:	.space 4000

	.text
code_start:
#	int k;
	li $s0, 0

main_start:
#	int i = 0;
	li $t0, 0

for_start:
	bltz $s0, for_end
	bge $s0, 1000, for_end

	sub $sp, $sp, 4
	sw $s0,($sp)

	jal fr2
	lw $s1, ($sp)
	la $t0, a
	add $t0, $t0, $s0
	sw $s1, ($t0)

main_end:
	j code_end

fr2:
	lw $t1, ($sp)
	blez $t1, if_fr2_0

#	faccio spazio nello stack e ci memorizzo il r.a.
	sub $sp, $sp, 8
	sw $ra, ($sp)

#	fr2 ( x - 1 );
	move $t2, $t1
	sub $t2, $t2, 1
	move $t2, ($sp)
	jal fr2

#	$t2 contiene fr2 ( x - 1 )
	lw $t2, ($sp)

#	ripristino il r.a.
	lw $ra, 4($sp)

#	$t3 contiene il parametro
	lw $t3, 8($sp)

	mult $t2, $t2, 3
	sub $t3, $t3, $t2

	add $sp, $sp, 8
	sw $t3, ($sp)
	jr $ra


if_fr2_0:
	sw $zero, ($sp)
	jr $ra
	
code_end:
