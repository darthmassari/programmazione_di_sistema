# Esercizio A (6 punti)
# Si scriva un programma con le seguenti caratteristiche:
#   ° La procedura principale del programma esegue le seguenti azioni:
#     ° Chiama la procedura f con parametro 10 e memorizza il risultato nella variabile R1
#     ° Chiama la procedura f con parametro 15 e memorizza il risultato nella variabile R2
#   ° La procedura f deve calcolare, in modo ricorsivo, il risultato della funzione matematica f(x),
#     che ha un parametro intero e produce un risultato intero, definita come segue(gli operatori
#     presenti nella definizione hanno lo stesso significato che in C Standard):
#     ° f(x) = 1                                        se x <= 0
#     ° f(x) = 3 * x - f( x / 7 ) + 2 * f( x / 5 )      se x > 0

# Si devono scrivere ed inviare 3 versioni del programma, che soddisfino i seguenti requisiti:
#	3  Versione ASM MIPS-MARS in cui:
#     - gli interi sono memorizzati in parole di formato word
#     - parametri e risultato sono passati attraverso lo stack

# Versione C
#   int f ( int x ) {
#     if( x <= 0 )
#       return 1;
#     return 3 * x - f( x / 7 ) + 2 * f( x / 5 );
#   }
#   
#   int r1, r2;
#   
#   int main ( void ) {
#     r1 = f( 10 );
#     r2 = f( 15 );
#   
#     return 0;
#   }


# Versione MIPS32-MARS
	.data 0x10010000
r1:	.word 0
r2: .word 0

	.text
main_start:
	li $s0, 10
	sub $sp, $sp, 4
	sw $s0, ($sp)
	jal f

	lw $s1, ($sp)
	la $a0, r1
	sw $s1, ($a0)

	li $s0, 15
	sw $s0, ($sp)
	jal f

	lw $s1, ($sp)
	la $a1, r2
	sw $s1, ($a1)

main_end:
	j code_end

f:
	lw $s0, ($sp)
	blez $s0, if_f_1

	move $t1, $s0
	move $t2, $s0
	mul $s0, $s0, 3
	div $t1, $t1, 7
	sub $sp, $sp, 8
	sw $t1, ($sp)
	sw $ra, 4($sp)
	jal f

	lw $t1, ($sp)
	lw $ra, 4($sp)
	sub $s0, $s0, $t1
	div $t2, $t2, 5
	sw $t2, ($sp)
	sw $ra, 4($sp)
	jal f

	lw $t2, ($sp)
	lw $ra, 4($sp)
	add $sp, $sp, 8
	mul $t2, $t2, 2
	add $s0, $s0, $t2
	sw $s0, ($sp)
	jr $ra

if_f_1:
	li $s0, 1
	sw $s0, ($sp)
	jr $ra

code_end: