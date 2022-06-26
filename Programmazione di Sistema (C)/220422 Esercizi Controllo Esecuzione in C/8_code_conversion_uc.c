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