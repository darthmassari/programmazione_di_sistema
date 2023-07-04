/*
* Esercizio A (6 punti)
* Si scriva un programma con le seguenti caratteristiche:
*   ° La procedura principale del programma esegue le seguenti azioni:
*     ° Chiama la procedura f con parametro 10 e memorizza il risultato nella variabile R1
*     ° Chiama la procedura f con parametro 15 e memorizza il risultato nella variabile R2
*   ° La procedura f deve calcolare, in modo ricorsivo, il risultato della funzione matematica f(x),
*     che ha un parametro intero e produce un risultato intero, definita come segue(gli operatori
*     presenti nella definizione hanno lo stesso significato che in C Standard):
*     ° f(x) = 1                                        se x <= 0
*     ° f(x) = 3 * x - f( x / 7 ) + 2 * f( x / 5 )      se x > 0
* 
* Si devono scrivere ed inviare 3 versioni del programma, che soddisfino i seguenti requisiti:
*   1  Versione C
*     - gli interi sono memorizzati in variabili di tipo int
*/

#include <stdio.h>

int f ( int x ) {
  if( x <= 0 )
    return 1;
  return 3 * x - f( x / 7 ) + 2 * f( x / 5 );
}

int r1, r2;

int main ( void ) {
  r1 = f( 10 );
  r2 = f( 15 );

  return 0;
}

