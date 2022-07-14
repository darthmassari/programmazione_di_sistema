* 2.L’esercizio 9 del gruppo “Controllo Esecuzione in C”, chiedeva di trasformare in stile unstructured, 
* un programma scritto in stile plain C. 
* Il programma è riportato sotto per comodità. 
* Si trasformi tale programma nei seguenti linguaggi:
* a)assembly MIPS32-MARS
* b)assembly MC68000-ASM1

* Plain C

#include <stdio.h>

int a, b, d1, d2, n;
int main( void ) {
	scanf( "%d%d%d%d", &a, &b, &d1, &d2 );
	n = 1;
	while ( a <= b ) {
		for ( int i = 0 ; i < n ; i++ ) {
			a += d1;
			b -= d2;
		}
		n++;
	}
	printf( "%d¥n", n );

	return 0; 
}

* MC68000-ASM1

* d0, d1, d2, d3, d4 = n, d1, d2, a, b

org $2000
* var in registers: d3, d4, d1, d2

code_start:
	move.w #1, d0
	
while_begin:
	cmp.w d4, d3
	bgt while_end

	clr d7

for_begin:
	cmp.w d0, d7
	bge for_end

	add.w d1, d3
	sub.w d2, d4

for_end:
	add.w #1, d0

while_end:

code_end: