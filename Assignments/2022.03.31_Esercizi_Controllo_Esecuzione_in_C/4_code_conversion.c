/*
* 4.Si trasformi il seguente programma plain C, in un programma equivalente 
* (ovvero che esegue le stesse operazioni e produce gli stessi risultati) in stile unstructured C
*/

// Plain C
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

// Unstructured C

#include <stdio.h>

int x = 2, y = 10, d;
int main (void) {
	scanf("%d", &d);
	int t1, t2;
	t1 = d + 3;
	t2 = x + y;

	if(t1 > t2) goto if_true;
		x += 5;
		y *= 2;

	if_true:
		t1 = d + y;
		x = t1 / 2;
		y = 6;

	printf("%d %d %d\n", x, y, d);

	return 0;
}