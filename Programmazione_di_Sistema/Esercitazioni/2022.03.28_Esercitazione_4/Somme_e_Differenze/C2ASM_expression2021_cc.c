/*
	LPS Example

	C to ASM: Expression 2021

	Language: C99
 	Style: concise C
 	Version: Ref-cc
 */

/*
	Original C Code
*/

/*
	Problem statement: transform a C program in an equivalent program
		in MIPS32-MARS and MC68000-ASM1
 */

int s1 = -325, s2, s3 = 826;

int main( void ) {

	s2 = 2048 - ( s1 + 22 ) + ( s3 - 329 );
	s1 -= ( s1 - 345 ) - ( s3 = s2 - ( s1 + 9 ) );

	return 0;
}

/*

Valori finali delle variabili
s1 : 3509
s2 : 2848
s3 : 3164

*/
