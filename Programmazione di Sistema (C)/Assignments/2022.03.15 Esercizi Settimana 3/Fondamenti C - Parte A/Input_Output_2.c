/*
* ⁃Si scriva un programma C che chiede all’utente di inserire 
* (tramite standard input) un numero floating point e che stampa 
* (su standard output) la metà del numero inserito dall’utente.
*/

#include <stdio.h>

int main (void) {
	float fnumber;
	printf("Inserisci un numero floating point: ");
	scanf("%f", &fnumber);
	printf("La metà del numero inserito è: %f", fnumber/2);
}