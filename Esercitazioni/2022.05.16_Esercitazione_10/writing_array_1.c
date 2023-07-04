#include <stdio.h>

int main(void) {
	printf("Inserire un numero maggiore di 0:");
	int n;
	scanf("%d", &n);

	if(n > 0) {
		int k = n * 2;
		int a3[n];

		for (int i = 0, j = 0; i < n; i++) {
			printf("Inserisci un numero intero: ");
			int k1;
			scanf("%d", &k1);
			a3[j] = k1;
			a3[j + 1] = -k1;
			j += 2;
		}

		printf("Tutti gli elementi sono:\n");
		
		for (int i = 0; i < k; i++) {
			printf("%d\n", a3[i]);
		}

	} else {
		printf("Numero non valido")
	}

	return 0;
}