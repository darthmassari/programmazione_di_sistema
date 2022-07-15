# Esercizio A (6 punti)
# Si scriva un programma con le seguenti caratteristiche:
#   ° La procedura principale del programma esegue le seguenti azioni:
#     ° Chiama la procedura f con parametro 10 e memorizza il risultato nella variabile R1
#     ° Chiama la procedura f con parametro 15 e memorizza il risultato nella variabile R2
#   ° La procedura f deve calcolare, in modo ricorsivo, il risultato della funzione matematica f(x),
#     che ha un parametro intero e produce un risultato intero, definita come segue(gli operatori
#     presenti nella definizione hanno lo stesso significato che in C Standard):
#     ° f(x) = 1                                        se x <= 0
#     ° f(x) = ( 110 - f( x/5 ) ) * ( 2 * x + 1 )       se x > 0
# 
# Si devono scrivere ed inviare 3 versioni del programma, che soddisfino i seguenti requisiti:
#   3  Versione ASM MIPS-MARS in cui:
#     - gli interi sono memorizzati in parole di formato word
#     - parametri e risultato sono passati attraverso registri

# Versione C
#	int f( int x ) {
#	  if ( x <= 0 ) 
#	    return 1;
#	  return ( 110 - f( x / 5 ) ) * ( 2 * x + 1 );
#	}
#	
#	int r1, r2;
#	
#	int main(void) {
#	  r1 = f( 10 );
#	  r2 = f( 15 );
#	  return 0;
#	}


# Versione ASM MIPS-MARS
	.data
r1:	.word 0
r2:	.word 0

	.text
main_start:
	li $s0, 10
	sub $sp, $sp, 4
	sw $s0, ($sp)
	jal f
	lw $s1, ($sp)
	add $sp, $sp, 4
	la $a1, #r1
	sw $s1, ($a1)

	li $s0, 15
	sub $sp, $sp, 4
	sw $s0, ($sp)
	jal f
	lw $s1, ($sp)
	la $a1, #r2
	sw $s1, ($a1)

main_end:
	j code_end

f:
	lw $t0, ($sp)
	blez $t0, if_f_0

	move $t1, $t0
	div $t1, $t1, 5
	sub $sp, $sp, 8
	sw $t1, ($sp)
	sw $ra, 4($sp)
	jal f
	lw $t1, ($sp)
	lw $ra, 4($sp)
	add $sp, $sp, 8
	li $t2, 110
	sub $t1, $t2, $t1

	mul $t0, $t0, 2
	add $t0, $t0, 1

	mul $t0, $t0, $t1
	sw $t0, ($sp)
	jr $ra

if_f_0:
	li $t0, 1
	sw $t0, ($sp)
	jr $ra

code_end: