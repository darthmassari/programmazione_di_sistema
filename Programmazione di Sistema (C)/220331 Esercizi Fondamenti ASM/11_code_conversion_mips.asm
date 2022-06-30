# 11.Si traduca il seguente programma C
# •in MIPS32-MARS, usando l’istruzione mul per effettuare le moltiplicazioni 
# e l’istruzione div con 2 operandi per effettuare le divisioni
# •in M68K-ASM1, usando il formato word per tutti i dati, tranne che per il risultato di muls 
# e per il dividendo di divs, che devono essere di formato long

# C

int s1 = 41, s2 = 8, s3 = -3;

int main( void ) {
	s3 += (13 - s2) - s1 % s2;
	s3 += - s3 - s2 * 5 / 3 ;
	s1 = 461 - s1 / s2;

	return 0; 
}

# MIPS32-MARS

.text
	li $s1, 41
	li $s2, 8
	li $s3, -3

code_start:
	div $s1, $s2
	mfhi $t0
	li $t1, 13
	sub $t1, $t1, $s2
	add $s3, $s3, $t1
	sub $s3, $s3, $t0

	mul $t0, $s2, 5
	div $t0, 3
	mflo $t1
	sub $t0, $s3, $t1
	sub $s3, $s3, $t0

	div $s1, $s2
	mflo $t0
	li $t1, 461
	sub $s1, $t1, $t0

code_end: