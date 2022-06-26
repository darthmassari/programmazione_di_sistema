#include <stdio.h>

int x = 2, y = 10, d;

int main( void ) {

	scanf( "%d", &d );

	if ( d + 3 > x + y ) {
		x += 5;
		y *= 2;
	} else {
		x = ( d + y ) / 2;
		y = 6;
	}

	printf( "%d %d %d¥n", x, y, d );
	return 0; 

}