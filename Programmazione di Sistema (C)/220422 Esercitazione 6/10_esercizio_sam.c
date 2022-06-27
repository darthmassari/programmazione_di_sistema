/*
10.	Sam ha trovato lavoro come programmatore presso una nuova azienda. 
Il suo capo, Chief Software Archi-Engineer, responsabile per la software 
quality, ha studiato informatica e quindi sa che l’uso dell’istruzione goto, 
e per estensione delle istruzioni break e continue, è proibito, perché lo ha 
asserito nientemeno che Dijkstra. Tutto il software va scritto applicando i 
sacri principi della Programmazione Strutturata! Aiutate Sam a conservare il 
suo posto di lavoro, trasformando il seguente programma C99 da lui scritto, 
in un programma equivalente che non usi alcuna istruzione proibita!

#include <stdio.h>

int n, i, h, k = -4;

int main( void ) {

	scanf( "%d", &n );
	for ( i = 0 ; i < n ; i++ ) {
		k += i;
		if ( k > 19 ) continue;
		printf( "%d ", k );
		scanf( "%d", &h );
		if ( h < 0 ) goto bad_input;
		k = k / 2 + h;
		if ( k % 2 == 0 ) continue;
		printf( "%d ", k );
		k += 3;
		if ( k < 5 ) break;
		k += 2;
		printf( "%d ", k );
	}
	printf( "%d ", h );
	k += h / 3;
bad_input:
	printf( "%d %d\n", k, i );
	
	return 0;

}
*/

//Istruzioni goto, break e continue proibite

#include <stdio.h>

int n, i, h, k = -4;
int exit_code;

int main( void ) {

	scanf( "%d", &n );
	for ( i = 0, exit_code = 1; i < n && exit_code = 1; i++ ) {
		k += i;
		if (!(k > 19)) {
			printf( "%d ", k );
			scanf( "%d", &h );
			if ( h < 0 )
				exit_code = 0;
			else {
				k = k / 2 + h;
				if (!(k % 2 == 0)) {
					printf( "%d ", k );
					k += 3;
					if (k < 5)
						exit_code = -1;
					else {
						k += 2;
						printf( "%d ", k );
					}
				}
			}
		}
	}
	if(exit_code != 1) i--;
	if(exit_code == 1) {
		printf( "%d ", h );
		k += h / 3;
	}

//bad_input:
	printf( "%d %d\n", k, i );
	
	return 0;

}