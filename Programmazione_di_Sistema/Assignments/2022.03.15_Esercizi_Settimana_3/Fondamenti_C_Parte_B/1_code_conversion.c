/*
* 1. Si trasformi il seguente programma plain C, in un programma equivalente 
* (ovvero che esegue le stesse operazioni e produce gli stessi risultati) in stile unstructured C
*/

// Plain C
#include <stdio.h>

int a, b = 10, c, d;

int main( void ) {
    c = b - 5;
    scanf( "%d", &d );
    b *= 3;
    a = ( d - 20 ) / c - 2;
    c = ( b - 13 ) - ( d % 4 );
    printf( "%d %d %d %d\n", a, b, c, d );

    return 0; 
}


// Unstructured C
#include <stdio.h>

int a, b = 10, c, d;

int main (void) {
	c = b - 5;
	scanf("%d", &d);

	b *= 3;

	a = d - 20;
	a /= c;
	a -= 2;

	int t1;
	c = b - 13;
	t1 = d % 4;
	c = c - t1;

	printf("%d %d %d %d\n", a, b, c, d);

	return 0;
}