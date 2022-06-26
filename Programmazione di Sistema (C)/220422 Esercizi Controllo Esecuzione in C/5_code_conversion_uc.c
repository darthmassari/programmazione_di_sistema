#include <stdio.h>

int x = 2, y = 10, d;

int main( void ) {

	scanf( "%d", &d );

	int t1, t2;
	t1 = d + 3;
	t2 = x + y;

	if(t1 > t2) goto if_true;

	int t3;
	t3 = d + y;
	x = t3 / 2;
	y = 6;
	goto if_end;

	if_true:
	x += 5;
	y *= 2;

	if_end:
	printf( "%d %d %d¥n", x, y, d );
	return 0; 
}