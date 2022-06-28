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