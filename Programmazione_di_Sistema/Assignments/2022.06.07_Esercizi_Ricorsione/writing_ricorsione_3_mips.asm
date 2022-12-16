# 2 Versione ASM MIPS32-MARS in cui:
# ⁃ gli interi sono memorizzati in parole di formato word
# ⁃ parametri e risultato sono passati attraverso lo stack
# ⁃ S viene memorizzata in una sequenza di parole allocate staticamente
# ⁃ l'accesso all'elemento di S in posizione 0, 
#	deve avvenire mediante il modo di indirizzamento Indiretto-Registro
# ⁃ l'accesso all'elemento di S in posizione 3, 
#	deve avvenire mediante il modo di indirizzamento Indicizzato con offset corto

# Versione C
#	int fr3 ( x ) {
#		if( x <= 0)
#			return 0;
#		if( x == 1)
#			return 3;
#		return fr3( x / 2 ) -2;
#	}
	
#	int main (void) {
#		int S[10];
#		S[3] = fr3( 32 );
#		S[0] = fr3( 7 );
#	}

	.data
s:	.space 20

	.text
# CORRISPONDENZA
# variabile input -> s0

main_start:
	li $s0, 32
	sub $sp, $sp, 4
	sw $s0, ($sp)
	jal fr3

	la $s1, s
	sw $s0, 3($s1)

	li $s0, 7
	sub $sp, $sp, 4
	sw $s0, ($sp)
	jal fr3

	la $s1, s
	sw $s0, ($s1)

main_end:
	j code_end

fr3:
	lw $t0, ($sp)
	blez $t0, if_fr3_0
	beq $t0, 1, if_fr3_1

#	return fr3( x / 2 ) - 2;
	div $t0, $t0, 2
	sub $sp, $sp, 8
	sw $ra, 4($sp)
	sw $t0, ($sp)
	jal fr3

	lw $t1, ($sp)
	lw $ra, 4($sp)

	sub $t1, $t1, 2
	add $sp, $sp, 8
	sw $t2, ($sp)
	jr $ra

if_fr3_0:
	sw $zero, ($sp)
	jr $ra

if_fr3_1:
	li $t0, 3
	sw $t0, ($sp)
	jr $ra

code_end: