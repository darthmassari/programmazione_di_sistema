# Scrivere una versione MIPS32-MARS della versione Plain C del programma

# Questo esempio mostra
# 1) Rappresentazione di array in ASM
# 2) Scansione sequenziale di un array in ASM

# #define N 8
# #include <stdio.h>

# int main( void )
# {
# 
#     int s, array[ N ] = { 204, -35, 8, 0, -17, 9, -22, 55 };
# 
#     /* variabile usata come indice per la scansione */
#     unsigned i;
# 
#     /* la somma degli elementi di un array può essere effettuata, utilizzando
#         gli indici per accedere agli elementi dell’array, con il ciclo seguente */
#     for ( s = 0, i = 0 ; i < N ; i++ ) s += array[ i ];
# 
#     /* output */
#     printf( "%d\n", s );
# 
#     return 0;
# }


.eqv N 8

.data 0x10010000
s: .word 0
array: .word 204,-35,8,0,-17,9,-22,55

.text
code_start:
	li 	$t0,0	# s = 0;
	li 	$t1,0 	# i = 0;

for_start:
	bge	$t1,N,for_end

	la	$a0,array 	# copia l'indirizzo della label array
	mulu 	$t2,$t1,4 	# va all'elemento successivo
	add	$a0,$a0,$t2	# aggiungo all'indirizzo array[0] la distanza di array[k]

	lw 	$t2,($a0) 	# leggo il contenuto di array[i]
	add $t0,$t0,$t2	# s += array[i];

	add $t1,$t1,1 	# i += 1;
	j for_start

for_end:
	sw 	$t0,s

code_end:

