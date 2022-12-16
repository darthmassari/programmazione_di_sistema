* Realizzare un programma con le seguenti caratteristiche:
* ◦ La procedura principale del programma esegue le seguenti azioni:
* 	◦ Chiama la procedura fr con parametro 42 e memorizza il risultato nella variabile R1
* 	◦ Chiama la procedura fr con parametro 11 e memorizza il risultato nella variabile R2
* ◦ La procedura fr deve calcolare il risultato della funzione matematica F(x), 
*	che ha un parametro intero e produce un risultato intero, definita come:
* 	◦ F( x ) = 4 se x <=0
* 	◦ F( x ) = x / 5 + (103 -F( x / 2 ) ) * ( F( x / 3 ) + 44 ) se x > 0

* Si devono scrivere 3 versioni del programma, che soddisfino i seguenti requisiti:
* 2 Versione ASM MC68000-ASM1 in cui:
* ⁃	gli interi sono memorizzati in parole di formato word
* ⁃	parametri e risultato sono passati attraverso lo stack

* Versione C
*	int fr( int x ) {
*		if( x <= 0 )
*			return 4;
*		return x / 5 + ( 103 -fr( x / 2 ) ) * ( fr( x / 3) + 44 ); 
*	}
*	
*	int r1, r2;
*	
*	int main (void) {
*		r1 = fr( 42 );
*		r2 = fr( 11 );
*	}


* Versione MC68000-ASM1
	org $4000
r1: dc.w 0
r2: dc.w 0

	org $2000
* CORRISPONDENZA
; variabile input e risultato-> d0

main_start:
	move.w #42, d0
	move.w d0, -(sp)
	bsr fr
	move.w (sp)+, d0
	move.w d0, r1

	move.w #11, d0
	move.w d0, -(sp)
	bsr fr
	move.w (sp)+, d0
	move.w d0, r2

main_end:
	bra code_end

* CORRISPONDENZA
; parametro -> d0
; registri per i calcoli -> d1, d2, d3
; risultato -> d3

fr:
	move.w (sp)+, d0
	tst d0
	ble if_fr_0

;	x / 5;
	move.w d0, d1
	divs #5, d1

;	103 - fr( x / 2 );
	move.w d0, d2
	divs #2, d2
	move.w d2, -(sp)
	bsr fr
	move.w (sp)+, d2
	move.w #103, d3
	sub d3, d2

;	fr( x / 3 ) + 44;
	move.w d0, d3
	divs #3, d3
	move.w d3, -(sp)
	bsr fr
	move.w (sp)+, d3
	add.w #44, d3

	muls d2, d3
	add.w d1, d3
	move.w d3, -(sp)
	rts

if_fr_0:
	move.w #4, d1
	move.w d1, -(sp)
	rts

code_end:
	end