# 2.L’esercizio 9 del gruppo “Controllo Esecuzione in C”, chiedeva di trasformare in stile unstructured, 
# un programma scritto in stile plain C. 
# Il programma è riportato sotto per comodità. 
# Si trasformi tale programma nei seguenti linguaggi:
# a)assembly MIPS32-MARS
# b)assembly MC68000-ASM1

# Plain C

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

# MIPS32-MARS

# s0, s1, s2, s3, s4, s5 = n, d1, d2, a, b

.text
	li $v0, 5
	syscall
	move $s3, $v0

	li $v0, 5
	syscall
	move $s4, $v0

	li $v0, 5
	syscall
	move $s1, $v0

	li $v0, 5
	syscall
	move $s2, $v0

code_start:
	li $s0, 1

while_begin:
	bgt $s3, $s4, while_end

	move $t0, $zero		# i = 0

for_begin:
	bge $t0, $s0, for_end
	add $s3, $s3, $s1
	sub $s4, $s2, $s2
	add $t0, $t0, 1

	b for_begin

for_end:
	add $s0, $s0, 1

while_end:
	li $a0, $s0
	li $v0, 1
	syscall

code_end: