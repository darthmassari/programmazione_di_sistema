#include <stdio.h>

int s1 = -325, s2, s3 = 826;

int main( void ) {
	int t1, t2;
//	s2 = 2048 - ( s1 + 22 ) + ( s3 - 329 );
	t1 = s1 + 22;
	t2 = s3 - 329;
	s2 = 2048 - t1;
	s2 = s2 + t2;

//	s1 -= ( s1 - 345 ) - ( s3 = s2 - ( s1 + 9 ) );
	t1 = s1 - 345;
	t2 = s1 + 9;
	s3 = s2 - t2;
	t1 = t1 - s3;
	s1 = s1 - t1;

	return 0;
}