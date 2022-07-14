# Realizzare un programma con le seguenti caratteristiche:
# ◦ La procedura principale del programma esegue le seguenti azioni:
# 	◦ Chiama la procedura fr con parametro 42 e memorizza il risultato nella variabile R1
# 	◦ Chiama la procedura fr con parametro 11 e memorizza il risultato nella variabile R2
# ◦ La procedura fr deve calcolare il risultato della funzione matematica F(x), 
#	che ha un parametro intero e produce un risultato intero, definita come:
# 	◦ F( x ) = 4 se x <=0
# 	◦ F( x ) = x / 5 + (103 -F( x / 2 ) ) * ( F( x / 3 ) + 44 ) se x > 0

# Si devono scrivere 3 versioni del programma, che soddisfino i seguenti requisiti:
# 3 Versione ASM MIPS32-MARS in cui:
# ⁃	gli interi sono memorizzati in parole di formato word
# ⁃	parametri e risultato sono passati attraverso lo stack

# Versione C
#	int fr( int x ) {
#		if( x <= 0 )
#			return 4;
#		return x / 5 + ( 103 -fr( x / 2 ) ) * ( fr( x / 3) + 44 ); 
#	}
#	
#	int r1, r2;
#	
#	int main (void) {
#		r1 = fr( 42 );
#		r2 = fr( 11 );
#	}


# Versione MIPS32-MARS
	.data
r1:	.word 0
r2:	.word 0

	.text
# CORRISPONDENZA
# variabile input -> $s0

main_start:
	li $s0, 42
	sub $sp, $sp, 4  
	sw $s0, ($sp)
	jal fr

	lw $s1, ($sp)
	la $a1, #r1
	sw $s1, ($a1)

	li $s0, 11
	sub $sp, $sp, 4
	sw $s0, ($sp)
	jal fr

	lw $s1, ($sp)
	la $a2, #r2
	sw $a1, ($a2)

main_end:
	j code_end

# CORRISPONDENZA
# parametro -> $t0
# registri per i calcoli -> $t1, $t2, $t3
# risultato -> $t3

fr:
	lw $t0, ($sp)
	blez $t0, if_fr_0
	sub $sp, $sp, 8

#	x / 5;
	move $t1, $t0
	div $t1, $t1, 5

#	103 - fr( x / 2);
	move $t2, $t0
	div $t2 $t2, 2
	sw $ra, 4($sp)
	sw $s2, ($sp)
	jal fr
	lw $t2, ($sp)
	lw $ra, 4($sp)
	add $sp, $sp, 8
	li $t3, 103
	sub $t2, $t3, $t2

#	fr( x / 3 ) + 44;
	move $t3, $t0
	div $t3, $t3, 3
	sw $ra, 4($sp)
	sw $t3, ($sp)
	jal fr
	lw $t3, ($sp)
	lw $ra, 4($sp)
	add $sp, $sp, 8
	add $t3, $t3, 44

	mul $t3, $t3, $t2
	add $t3, $t3, $t1
	sw $t3, ($sp)
	jr $ra

if_fr_0:
	li $t1, 4
	sw $t1, ($sp)
	jar $ra

code_end: