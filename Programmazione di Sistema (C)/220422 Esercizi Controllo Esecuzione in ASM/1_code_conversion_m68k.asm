* 1. L’esercizio 8 del gruppo “Controllo Esecuzione in C”, chiedeva di trasformare in stile unstructured, 
* un programma scritto in stile plain C. 
* Il programma è riportato sotto per comodità. 
* Si trasformi tale programma nei seguenti linguaggi:
* a) assembly MIPS32-MARS
* b) assembly MC68000-ASM1

* Plain C
#include <stdio.h>

int c, n, h = 1;
int main( void ) {
	scanf( "%d", &n );
	for ( c = 0 ; n > 0 ; n -= h, h += 2 )
		c++;
	printf( "%d¥n", c );
	return 0; 
}

* MC68000-ASM1

* d0, d1, d2 = c, n, h

org $2000
* var in registers: d1

	move.w #1, d2
	clr.w t6

for_begin:
	tst.w d1
	ble for_end

	add.w #1, d0
	sub.w d2, d1
	add.w #2, d2
	bra for_begin

for_end:

code_end:

END