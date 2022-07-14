/*
* Si scriva un programma con le seguenti caratteristiche:
* ◦ La procedura principale del programma esegue le seguenti azioni:
* 	◦ Per ciascun intero K maggiore o uguale a 0 e minore di 1000, 
	  chiama la procedura FR2 con parametro K e memorizza il risultato nella posizione K di un array
* ◦ La procedura FR2 deve calcolare, in modo ricorsivo, il risultato della funzione F(x), 
	che ha un parametro intero e produce un risultato intero, definita come:
* 	◦ F( x ) = 0 se x <= 0
*	◦ F( x ) = x -( 3 * F( x -1 )) se x > 0

* Realizzare 3 versioni del programma, che soddisfino i seguenti requisiti:
* 1 Versione C
*/


#include <stdio.h>

int fr2 ( int x ){
	if( x <= 0 )
		return 0;
	return x -( 3 * fr2( x - 1 ));
}

int k;
int array[1000];

int main (void) {
	for ( int i = 0; 0<=k<1000; i++ ) { 
		printf("Inserisci un numero intero: ");
		scanf("%d", &k);
		array[ k ] = fr2( k );
	}
}

