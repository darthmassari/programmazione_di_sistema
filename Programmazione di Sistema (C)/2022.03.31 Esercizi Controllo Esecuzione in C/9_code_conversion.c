/*
* 9.Si trasformi il seguente programma plain C, in un programma equivalente 
* (ovvero che esegue le stesse operazioni e produce gli stessi risultati) in stile unstructured C
*/

// Plain C

#include <stdio.h>

int a, b, d1, d2, n;
int main( void ) {
	scanf( "%d%d%d%d", &a, &b, &d1, &d2 );
	n = 1;
	while ( a <= b ) {
		for ( int i = 0 ; i < n ; i++ ) {
			a += d1;
			b -= d2;
		}
		n++;
	}
	printf( "%d¥n", n );
	return 0; 
}

// Unstructured C

#include <stdio.h>

int a, b, d1, d2, n;
int main( void ) {
	scanf( "%d%d%d%d", &a, &b, &d1, &d2 );
	n = 1;

	while_begin:
		if(a > b) goto while_end;
		
		int i = 0;
		for_begin:
			if(i >= n) goto for_end;
				a += d1;
				b -= d2;
				i += 1;
				goto for_begin;

		for_end:
			n += 1;
			goto while_begin;

	while_end:
		printf("%d\n", n);

		return 0;
}