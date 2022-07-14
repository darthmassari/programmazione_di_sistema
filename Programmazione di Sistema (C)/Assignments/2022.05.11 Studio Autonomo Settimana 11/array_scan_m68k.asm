* Scrivere una versione ASM M68K della versione Plain C del programma

* Questo esempio mostra
* 1) Rappresentazione di array in ASM
* 2) Scansione sequenziale di un array in ASM

* #define N 8
* #include <stdio.h>

* int main( void )
* {
* 
*     int s, array[ N ] = { 204, -35, 8, 0, -17, 9, -22, 55 };
* 
*     /* variabile usata come indice per la scansione */
*     unsigned i;
* 
*     /* la somma degli elementi di un array può essere effettuata, utilizzando
*         gli indici per accedere agli elementi dell’array, con il ciclo seguente */
*     for ( s = 0, i = 0 ; i < N ; i++ ) s += array[ i ];
* 
*     /* output */
*     printf( "%d\n", s );
* 
*     return 0;
* }


N: equ 8

org $4000

s: dc.l 0
array: dc.l 204,-35,8,0,-17,9,-22,55

org $2000
code_start:
    clr.l   d1  ; i = 0;
    clr.l   d0  ; s = 0;


for_start:
    cmp.l   #N,d1
    bge for_end
 
    move.l  #array,a1   ; copia l'indirizzo della label array
    move.l  d1,d3  
    mulu    #4,d3   ; va all'elemento successivo
    add.l   d3,a1   ; aggiungo all'indirizzo array[0] la distanza di array[k]

    add.l   (a1),d0 ; s += array[i]

    add.l   #1,d1   ; i += 1;
    bra for_start

for_end:
    move.l  d0,s

end

