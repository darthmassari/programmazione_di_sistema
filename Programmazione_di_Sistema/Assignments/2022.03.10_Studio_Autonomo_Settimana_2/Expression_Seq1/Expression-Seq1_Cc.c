/*
	LPS Example

	Expression Seq 1

	Language: C99
 	Style: concise C
 	Version: Ref-pc
 */

/*
	Original Concise C Code
*/

#include <stdio.h>

int i = 2, j;

int g( int x ) {

	return x + i++;
}

int main( void ) {
 
	j = i * g( 3 );
	printf( " %d %d\n", i, j );

	return 0; 
}
