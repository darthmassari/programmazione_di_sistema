/*
	LPS Example

	Do UC: Expression 2020

	Language: C99
 	Style: unstructured C
 	Version: LPS22-L02
 */

/*
	Unstructured Solution
*/

#include <stdio.h>

int a = 4, b, c = -19;
float x, y = 3, z = 2.8f;

int f2020( float par ) {

	float h;
	
	z += 1;
	h = y + z;
	h /= 2;

	float t1, t2;
	t1 = 3.5f;
	t2 = par / 2;
	t1 = t1 - t2;
	t1 = t1 + z;
	y += t1;

    int t3;

	t3 = 2 + h;
	t1 = par * 2;
	t3 /= t1;

	return t3;
}

int main(void) {
    
    printf("\nInput\n");
    scanf("%d", &b);
    
    float t4, t5;
    
    b = b + 1;
    t4 = 2.5f;
    t4 = t4 + z;
    t5 = b * 3;
    c = c + t5;
    t5 = c / y;
    t4 = t4 - t5;
    x = t4 - 20;
    
    float t6, t7, t8;
    
    a = a - 1;
    t6 = y - b;
    t6 = f2020(t6);
    t7 = 4 * b;
    t8 = c + a;
    t8 = t8 + t6;
    t8 = t8 + t7;
    x = x + t8;
    c = c + 1;
    
    printf( "\nOutput\n" );
	printf( "%d %d %d\n", a, b, c );
	printf( "%.2f %.2f %.2f\n\n", x, y, z );

	return 0;
}
