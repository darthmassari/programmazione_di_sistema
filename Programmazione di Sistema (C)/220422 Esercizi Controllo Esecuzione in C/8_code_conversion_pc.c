#include <stdio.h>

int c, n, h = 1;

int main( void ) {

	scanf( "%d", &n );

	for ( c = 0 ; n > 0 ; n -= h, h += 2 )
		c++;

	printf( "%d\n", c );
	return 0; 
}
