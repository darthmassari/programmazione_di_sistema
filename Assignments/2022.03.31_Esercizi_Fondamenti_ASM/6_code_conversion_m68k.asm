* 6.Si traduce il seguente programma C in un programma equivalente
* •in MIPS32-MARS
* •in M68K-ASM1, usando, per tutti i dati, il formato byte


* C
int s1 = 23, s2 = 9, s3 = -11;

int main( void ) {
	s2 = s1 + s2 + 4;
	s3 = s2 - (14 - s1);
	s1 = s2 - s3 - 15;

	return 0; 
}

* M68K-ASM1

org $2000
	move.b #23, d1
	move.b #9, d2
	move.b #-11, d3

code_start:
	move.b d2, d6
	add.b d1, d6
	add.b #4, d6
	move.b d6, d2

	move.b d1, d6
	sub.b 14, d1
	sub.b d2, d6
	move.b d6, d3

	move.b #15, d7
	sub.b d3, d7
	sub.b d2, d7
	move.b d7, d1

code_end:

END