/*
* 6.Si trasformi il seguente programma concise C, in un programma equivalente 
* (ovvero che esegue le stesse operazioni e produce gli stessi risultati) in stile unstructured C
*/

// Concise C
#include <stdio.h>

int a, b, c = -9, d = 11;

int f( int x ) {
	x += d = x + c / x;
	return c * -d + x;
}

int main( void ) {
	scanf( "%d", &a );
	b = 3 * ( a -= c * --d + 13 ) + ( c + 12 ) / 4;
	c = a * -b / f( 42 + c / 3 );

	printf( "%d %d %d %d\n", a, b, c, d );

	d = f((c += a + 2 * d) + 7)+(b *= ( a + 7 )/ + a -2 );
	c += d++ -++b ---a;
	printf( " %d %d %d %d", a, b, c, d );
	
	return 0; 
}

//Unstructured C
//DA CORREGGERE
#include <stdio.h>

int a, b, c = -9, d = 11;

int f( int x ) {

	int t1;
	d = c / x;
	d += x;
	x += d;
	t1 = -d;
	t1 *= c;
	t1 += x;
}

int main (void) {
	scanf( "%d", &a );

	int t2, t3;
	d -= 1;
	t2 = c * d;
	t2 += 13;
	a -= t2;
	t3 = c + 12;
	t3 /= 4;
	b = 3 * a;
	b += t3;

	t2 = c / 3;
	t2 += 42;
	t3 = -b;
	c = a * t3;
	c /= f(t2);

	printf( "%d %d %d %d\n", a, b, c, d );

	t2 = a + 2;
	t2 *= d;
	c += t2;
	t2 = c + 7;
	t3 = a + 7;
	t3 /= a;
	t3 -= 2;
	b *= t3;
	d = f(t2);
	d += b;

	b += 1;
	a -= 1;
	t2 = d - b;
	t2 -= a;
	c += t2;
	d += 1;

	printf( "%d %d %d %d", a, b, c, d );
	
	return 0; 
}