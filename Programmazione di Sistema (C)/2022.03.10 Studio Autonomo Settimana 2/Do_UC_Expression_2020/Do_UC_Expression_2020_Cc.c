/*
	LPS Example

	Do UC: Expression 2020

	Language: C99
 	Style: concise C
 	Version: Ref-cc
 */

/*
	Original Plain C Code
*/

#include <stdio.h>

int a = 4, b, c = -19;
float x, y = 3, z = 2.8f;

int f2020( float par ) {

	float h = ( y + ++ z ) / 2;

	y += 3.5f - par / 2 - - z;

	return ( 2 + h ) / ( par * 2 );
}

int main( void ) {

	printf( "\nInput\n" );
	scanf( "%d", &b );

	x = ( z + 2.5f ) - ( c += 3 * ++b ) / y - 20;

	x += c-- + --a + f2020( y + - b ) + - 4 * b;

	printf( "\nOutput\n" );
	printf( "%d %d %d\n", a, b, c );
	printf( "%.2f %.2f %.2f\n\n", x, y, z );

	return 0;
}

/*
	Problem statement: transform a plain C program in an equivalent program in unstructured C

 Si trasformi il seguente programma C, in un programma equivalente
 (ovvero che esegue le stesse operazioni e produce gli stessi risultati) in stile UC.
*/
