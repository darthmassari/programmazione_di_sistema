/*
* 6.Si trasformi il seguente programma plain C, in un programma equivalente 
* (ovvero che esegue le stesse operazionie produce gli stessi risultati) in stile unstructured C
*/

// Plain C
#include <stdio.h>

int x = 2, y = 10, d;
int main( void ) {
	scanf( "%d", &d );

	if ( d <= x ) {
		x += d;
		if ( d < -y || !d )
			y -= 5;
		else
			y -= d;
	} else
	x = ( d <= y ) ? d : y -1;

	printf( "%d %d %d¥n", x, y, d );

	return 0; 
}

// Unstructured C
#include <stdio.h>

int x = 2, y = 10, d;
int main( void ) {

	scanf( "%d", &d );

	if(d > x) goto if_false;

		x += d;
		if(d < -y) goto if_true_1;
		if(!d) goto if_true_1;
			x = y - 1;
			goto code_end;

		if_true_1:
			x = d;
			goto code_end		

	if_false:
		if(d <= y) goto if_true_2;
			x = y - 1;
			goto code_end;

		if_true_2:
			x = d;

	code_end:
		printf( "%d %d %d¥n", x, y, d );
		return 0;
}