# Realizzare 3 versioni del programma, che soddisfino i seguenti requisiti:
# 3 Versione ASM MIPS32-MARS in cui:
#	⁃ gli interi sono memorizzati in parole di formato word
#	⁃ parametri e risultato sono passati attraverso lo stack

# Si scriva un programma con le seguenti caratteristiche:
# ◦ La procedura principale del programma chiama la procedura fr1 con parametro 22
# ◦ La procedura fr1 deve calcolare, in modo ricorsivo, il risultato della
#	funzione matematica F(x), che ha un parametro intero e produce un
#	risultato intero, definita come:
#		◦ F( x ) = 0 se x <=0
#		◦ F( x ) = 3 se x = 1
#		◦ F( x ) = F( x / 3 ) + x se x > 1

# Versione C
#	int fr1 ( int x ) {
#		if( x <= 0 )
#			return 0;
#		if( x == 1 )
#			return 3;
#		return fr1( x / 3 ) + x;
#	}

#	int r, x = 22;

#	int main (void) {
#		r = fr1 ( x );
#		printf("Risultato: %d", r);
#	}


# MIPS32-MARS

# Dichiarazione variabili esterne
	.data
x:	.word 22
r:	.word 0

	.text
code_start:
main_start:
	lw $s0, x

#	faccio spazio nello stack
	sub $sp, $sp, 4		

# 	push di x nello stack
	sw $s0, ($sp)	

#	r = fr1 ( x );
	jal fr1
	lw $s1, ($sp)
	sw $s1, r

# Termine della funzione main
main_end:
	j code_end


# Routine fr1
fr1:

# 	carico x dallo stack in $t0
	lw $t0, ($sp)		

#	if (x <= 0);
	blez if_fr1_0		

# 	if (x == 1);
	beq $t0, 1, if_fr1_1	

# 	faccio spazio nello stack (tengo in considerazione r.a. + parametro)
	sub $sp, $sp, 8	

#	aggiungo il r.a. nello stack per evitare di perderlo nell'invocazione ricorsiva
	sw $ra, 4($sp)

#	fr1( x / 3 );
	move $t1, $t0
	div $t1, $t1, 3
	sw $t1, ($sp)
	jal fr1
	lw $t1, ($sp)

# 	recupero il r.a. dallo stack
	lw $ra, 4($sp)

#	recupero il parametro dallo stack
	lw $t2, 8($sp)

#	fr1( x / 3 ) + x;
	add $t2, $t2, $t1

# 	pop del r.a. + parametro dell'ultima routine invocata
	add $sp, $sp, 8	

#	inserisco il risultato nello stack
	sw $t2, ($sp)
	jr $ra


if_fr1_0:
#	return 0;
	sw $zero, ($sp)	
	jr $ra

if_fr1_1:
#	return 3;
	li $t1, 3
	sw $t1, ($sp)
	jr $ra

code_end: