/*
* ⁃Esercizio: 
* ⁃Scrivere un programma che legge da standard input un numero floating point che rappresenta la misura del raggio di un cerchio. 
* Il programma deve stampare la misura della circonferenza e la misura dell’area del cerchio, come numeri floating point 
* con 2 cifre dopo il punto decimale. Per stampare valori floating point nel formato richiesto, si usi, nella funzione
* printf lo specificatore %.2f(ad esempio per stampare il contenuto di una variabile floating point chiamata area, 
* si scriva printf( "%.2f", area);nel programma C). 
* Il programma deve definire una macro che si espande nel valore di pi greco approssimato con5 cifre decimali, 
* e usare tale macro nei calcoli di circonferenza e area del cerchio
* ⁃Attenzione: il programma non deve stampare nulla altro che i numeri attesi in output.
*/


#include <stdio.h>

#define PI 3.14159f

int main (void) {
	float raggio;
	printf("Inserisci raggio: ");
	scanf("%f", &raggio);

	printf("La circonferenza è: %2f", 2 *PI * raggio);
	printf("L'area è: %2f", PI * raggio * raggio);

	return 0;
}