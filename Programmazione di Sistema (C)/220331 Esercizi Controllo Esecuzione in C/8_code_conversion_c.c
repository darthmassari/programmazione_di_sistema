/*
* 8. Si trasformi il seguente programma plain C, in un programma equivalente 
* (ovvero che esegue le stesse operazioni e produce gli stessi risultati) in stile unstructured C
*/

// Plain C
#include <stdio.h>

int c, n, h = 1;

int main( void ) {

	scanf( "%d", &n );

	for ( c = 0 ; n > 0 ; n -= h, h += 2 )
		c++;

	printf( "%d\n", c );
	return 0; 
}


// Unstructured C
#include <stdio.h>

int c, n, h = 1;

int main( void ) {

	scanf( "%d", &n );

	c = 0;
	for_begin:
	if (n <= 0) goto for_end;
		n -= h;
		h += 2;
		c++;
		goto for_begin

	for_end:
	printf( "%d\n", c );
	return 0;
}