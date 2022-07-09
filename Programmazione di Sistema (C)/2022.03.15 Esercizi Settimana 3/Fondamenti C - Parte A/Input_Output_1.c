/*
* ⁃Esercizio: 
* Dopo aver studiato tali sezioni, si scriva un programma C che chiede all’utente di inserire 
* (tramite standard input) un numero intero e che stampa (su standard output) il triplo del numero inserito dall’utente.
*/

#include <stdio.h>

int main(void) {
	printf("Inserisci un numero: ");
	int n = 0;
	scanf("%d", &n);
	// n *= 3;
	// Posso risolvere tutto in un unico comando
	printf("Il triplo del numero inserito è: %d\n", n*3);
}