* 11.Si traduca il seguente programma C
* •in MIPS32-MARS, usando l’istruzione mul per effettuare le moltiplicazioni 
* e l’istruzione div con 2 operandi per effettuare le divisioni
* •in M68K-ASM1, usando il formato word per tutti i dati, tranne che per il risultato di muls 
* e per il dividendo di divs, che devono essere di formato long

* C

int s1 = 41, s2 = 8, s3 = -3;

int main( void ) {
	s3 += (13 - s2) - s1 % s2;
	s3 += - s3 - s2 * 5 / 3 ;
	s1 = 461 - s1 / s2;

	return 0; 
}

* M68K-ASM1

org $2000
	move.w #41, d1
	move.w #8, d2
	move.w #-3, d3

code_start:
	move.w d2, d6
	divs s1, d6
	swap d6
	move.w d2, d7
	sub.w #13, d7
	add.w d3, d7
	sub.w d7, d6
	move.w d6, d3

	move.w #5, d6
	muls d2, d6
	move.w #3, d7
	divs d6, d7
	move.w d3, d6
	sub.w d3, d6
	sub.w d6, d7
	move.w d7, d3

	move.w d2, d6
	divs d1, d6
	sub.w #461, d6
	move.w d6, d1

code_end:

END
