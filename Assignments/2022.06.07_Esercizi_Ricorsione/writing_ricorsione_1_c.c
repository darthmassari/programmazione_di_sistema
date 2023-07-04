/*
* Realizzare 3 versioni del programma, che soddisfino i seguenti requisiti:
* 1	Versione C
* ⁃	gli interi sono memorizzati con variabili di tipo int

* Si scriva un programma con le seguenti caratteristiche:
* ◦ La procedura principale del programma chiama la procedura fr1 con parametro 22
* ◦ La procedura fr1 deve calcolare, in modo ricorsivo, il risultato della
*	funzione matematica F(x), che ha un parametro intero e produce un
*	risultato intero, definita come:
*		◦ F( x ) = 0 se x <=0
*		◦ F( x ) = 3 se x = 1
*		◦ F( x ) = F( x / 3 ) + x se x > 1
*/

#include <stdio.h>

int fr1 ( int x ) {
	if( x <= 0 )
		return 0;
	if( x == 1 )
		return 3;
	return fr1( x / 3 ) + x;
}

// Dichiarazione variabili esterne
int r, x = 22;

int main (void) {
	r = fr1 ( x );
	printf("Risultato: %d", r);
}