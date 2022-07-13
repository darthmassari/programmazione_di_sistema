* Si scriva un programma con le seguenti caratteristiche:
* ◦ La procedura principale del programma esegue le seguenti azioni:
* 	◦ Per ciascun intero K maggiore o uguale a 0 e minore di 1000, 
*	  chiama la procedura FR2 con parametro K e memorizza il risultato nella posizione K di un array
* ◦ La procedura FR2 deve calcolare, in modo ricorsivo, il risultato della funzione F(x), 
*	che ha un parametro intero e produce un risultato intero, definita come:
* 	◦ F( x ) = 0 se x <= 0
*	◦ F( x ) = x -( 3 * F( x -1 )) se x > 0

* Realizzare 3 versioni del programma, che soddisfino i seguenti requisiti:
* 3 Versione ASM MC68000-ASM1

* Versione C
*	int fr2 ( int x ){
*		if( x <= 0 )
*			return 0;
*		return x -( 3 * fr2( x - 1 ));
*	}
*	
*	int k;
*	int array[1000];
*	
*	int main (void) {
*		for ( int i = 0; 0<=k<1000; i++ ) { 
*			printf("Inserisci un numero intero: ");
*			scanf("%d", &k);
*			array[ k ] = fr2( k );
*		}
*	}


* CORRISPONDENZA
; k -> d0
; i -> d1
; risultato della chiamata -> d2
; indirizzo dell'array -> d3

	org $4000
a: ds.w 1000

	org $2000
code_start:
;	int k;
	clr.w d0

main_start:
;	int i = 0;
	clr.w d1

for_start:
	tst.w d0
	blt for_end
	cmp.w #1000,d0
	bge for_end

	move.w d0, -(sp)
	bsr fr2
	move.w (sp)+, d2
	move.w #array, d3
	add.w d0, d3
	move.w d2, (d3)

main_end:
	bra code_end
	
* CORRISPONDENZA
; parametro -> d2
; risultato della chiamata a funzione interna -> d3

fr2:
	move.w (sp)+, d2
	tst d2
	ble if_fr2_0

;	fr2( x - 1 );
	move.w d2, d3
	sub.w #1, d3
	move.w d3, -(sp)
	bsr fr2

	move.w (sp)+, d3
	move.w (sp)+, d2

	muls #3, d3
	sub d3, d2

	move.w d2, -(sp)
	rts

if_fr2_0
	move.w #0, -(sp)
	rts

code_end:
	END