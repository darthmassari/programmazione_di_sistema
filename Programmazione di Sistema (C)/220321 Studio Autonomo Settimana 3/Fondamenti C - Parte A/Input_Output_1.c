/*
Chiede un numero all'utente e stampa il triplo
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