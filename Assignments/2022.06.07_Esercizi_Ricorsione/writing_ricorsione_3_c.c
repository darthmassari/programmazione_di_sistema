/*
* Si scriva un programma con le seguenti caratteristiche:
* ◦	La procedura principale del programma definisce una sequenza 
*	S di 10 valori interi, ed esegue le seguenti azioni:
* ◦		Chiama la procedura fr3 con parametro 32 e memorizza il risultato nella posizione 3 di S
* ◦		Chiama la procedura fr3 con parametro 7 e memorizza il risultato nella posizione 0 di S
* ◦	La procedura fr3 deve calcolare, in modo ricorsivo, il risultato della funzione matematica F(x), 
*	che ha un parametro intero e produce un risultato intero, definita come:
* ◦		F( x ) = 0 se x <=0
* ◦		F( x ) = 3 se x = 1
* ◦		F( x ) = F( x / 2 ) -2 se x > 1 

* Realizzare 3 versioni del programma, che soddisfino i seguenti requisiti:
* 1 Versione C
* ⁃	gli interi sono memorizzati con variabili di tipo int
* ⁃	S viene memorizzata in un array allocato staticamente
*/

#include <stdio.h>

int fr3 ( x ) {
	if( x <= 0)
		return 0;
	if( x == 1)
		return 3;
	return fr3( x / 2 ) -2;
}

int main (void) {
	int S[10];
	S[3] = fr3( 32 );
	S[0] = fr3( 7 );
}
