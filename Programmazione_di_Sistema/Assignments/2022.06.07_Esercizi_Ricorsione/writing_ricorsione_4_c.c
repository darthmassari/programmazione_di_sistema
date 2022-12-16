/*
* Realizzare un programma con le seguenti caratteristiche:
* ◦ La procedura principale del programma esegue le seguenti azioni:
* 	◦ Chiama la procedura fr con parametro 42 e memorizza il risultato nella variabile R1
* 	◦ Chiama la procedura fr con parametro 11 e memorizza il risultato nella variabile R2
* ◦ La procedura fr deve calcolare il risultato della funzione matematica F(x), 
*	che ha un parametro intero e produce un risultato intero, definita come:
* 	◦ F( x ) = 4 se x <=0
* 	◦ F( x ) = x / 5 + (103 -F( x / 2 ) ) * ( F( x / 3 ) + 44 ) se x > 0

* Si devono scrivere 3 versioni del programma, che soddisfino i seguenti requisiti:
* 1 Versione C
* ⁃	gli interi sono memorizzati in variabili di tipo int
*/

#include <stdio.h>

int fr( int x ) {
	if( x <= 0 )
		return 4;
	return x / 5 + ( 103 -fr( x / 2 ) ) * ( fr( x / 3) + 44 ); 
}

int r1, r2;

int main (void) {
	r1 = fr( 42 );
	r2 = fr( 11 );
	return 0;
}