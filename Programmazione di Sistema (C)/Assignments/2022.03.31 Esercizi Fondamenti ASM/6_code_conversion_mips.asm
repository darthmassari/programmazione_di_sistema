# 6.Si traduce il seguente programma C in un programma equivalente
# •in MIPS32-MARS
# •in M68K-ASM1, usando, per tutti i dati, il formato byte


# C
int s1 = 23, s2 = 9, s3 = -11;

int main( void ) {
	s2 = s1 + s2 + 4;
	s3 = s2 - (14 - s1);
	s1 = s2 - s3 - 15;

	return 0; 
}

# MIPS32-MARS

.text
	li $s1, 23
	li $s2, 9
	li $s3, -11

code_start:
	add $t0, $s2, 4
	add $s2, $s1, $t1

	li $t1, 14
	sub $t0, $t1, $s1
	sub $s3, $s2, $t0

	sub $s1, $s2, $s3
	sub $s1, $s1, 15

code_end: