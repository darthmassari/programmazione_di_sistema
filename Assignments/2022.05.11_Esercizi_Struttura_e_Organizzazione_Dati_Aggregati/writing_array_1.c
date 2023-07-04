/*
* Si scriva un programma C99 in cui
* 1.	viene chiesto all'utente di inserire un numero intero n maggiore di 0
* 2.	viene chiesto all'utente di inserire n numeri interi: 
* 		per ciascun numero x inserito, si devono memorizzare (seguendo l'ordine di inserimento) 
* 		il valore di x e il valore -x in un VLA di opportuna lunghezza
* 3.	al termine degli inserimenti, viene stampato il contenuto del VLA
*/

#include <stdio.h>

int main(void) {
	int n;
	printf("Inserisci un numero intero maggiore di 0: ");
	scanf("%d", &n);
	int a[n];
	int k;

	if(n > 0) {
		int k;
		for(int i = 0, j = 0; i < n; i++, j+=2) {
			printf("Inserisci un numero intero: ");
			scanf("%d", &k);
			a[j] = k;
			a[j + 1] = -k;
		}
		for(int i = 0; i < k * 2; i++) {
			printf("Elemento %d: %d \n", i, a[i]);
		}
		
	} else {
		printf("Numero non valido\n");
	}
	return 0;
}