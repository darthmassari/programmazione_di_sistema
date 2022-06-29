/*
* 2.  Si trasformi il seguente programma concise C, in un programma equivalente 
* (ovvero che esegue le stesse operazioni e produce gli stessi risultati) in stile unstructured C
*/

// Concise C
#include <stdio.h>

int a, b = 10, c, d;

int main( void ) {
    scanf( "%d%d", &a, &d );
    c = 5;
    a = ( a + 7 ) / ( 13 - d );
    printf( "%d %d", a + 2, c % 3);
    b = ( b * 4 ) - ( c = d ) * ( d - 4 + - a );
    d = -c;
    printf( " %d %d %d %d\n", a, b, c , d );

    return 0; 
}



//Unstructured C
#include <stdio.h>

int a, b = 10, c, d;

int main( void ) {
    scanf( "%d%d", &a, &d );
    c = 5;

    int t1;
    a += 7;
    t1 = 13 - d;
    a /= t1;

    printf( "%d %d", a + 2, c % 3);

    int t2;
    b *= 4;
    c = d;
    t1 = c;
    t2 = d - 4;
    t2 -= a;
    b -= t1;
    b *= t2;

    d = -c;

    printf( " %d %d %d %d\n", a, b, c , d );

    return 0;
}