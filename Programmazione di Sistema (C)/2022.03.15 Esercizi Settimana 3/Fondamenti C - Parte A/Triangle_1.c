/*
* - Esercizio
* - Usando sqrtf, scrivete un programma che legge due numeri floating point che 
* rappresentano le lunghezze dell’ipotenusa e di uno dei cateti di un triangolo rettangolo. 
* Il programma deve stampare la lunghezza dell’altro cateto del triangolo come numero floating point 
* con 2 cifre dopo il punto decimale. 
* Per stampare valori floating point nel formato richiesto, si usi, nella funzione printf
* lo specificatore %.2f(ad esempio per stampare il contenuto di una variabile floating point 
* chiamata area, si scriva printf( "%.2f", area); nel programma C).
* ⁃Attenzione: il programma non deve stampare nulla altro che i numeri attesi in output
*/

#include <stdio.h>
#include <math.h>

int main (void) {

	float lipo, lcat1, lcat2;

	printf("Inserisci lunghezza ipotenusa in floating point: ");
	scanf("%f", &lipo);
	printf("\nInserisci lunghezza di un cateto in floating point: ");
	scanf("%f", &lcat1);
	
	lcat2 = sqrtf((lipo * lipo) - (lcat1 * lcat1));
	printf("\nLa lunghezza del secondo cateto è: %.2f", lcat2);

	return 0;
}