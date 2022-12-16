# 1. L’esercizio 8 del gruppo “Controllo Esecuzione in C”, chiedeva di trasformare in stile unstructured, 
# un programma scritto in stile plain C. 
# Il programma è riportato sotto per comodità. 
# Si trasformi tale programma nei seguenti linguaggi:
# a) assembly MIPS32-MARS
# b) assembly MC68000-ASM1

# Plain C
#include <stdio.h>

int c, n, h = 1;
int main( void ) {
	scanf( "%d", &n );
	for ( c = 0 ; n > 0 ; n -= h, h += 2 )
		c++;
	printf( "%d¥n", c );
	return 0; 
}

# MIPS32-MARS

# s0, s1, s2 = c, n, h

.text
# var in registers: s1

	li $s2, 1
	move $s0, $zero		

for_begin:
	blez $s1, for_end
	add $s0, $s0, 1
	sub $s1, $s1, $s2
	add $s2, $s2, 2
	b for_begin


for_end:
	
code_end: