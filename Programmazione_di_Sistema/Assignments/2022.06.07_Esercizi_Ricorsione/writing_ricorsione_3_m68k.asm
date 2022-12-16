* Si scriva un programma con le seguenti caratteristiche:
* ◦	La procedura principale del programma definisce una sequenza 
*	S di 10 valori interi, ed esegue le seguenti azioni:
* ◦		Chiama la procedura fr3 con parametro 32 e memorizza il risultato nella posizione 3 di S
* ◦		Chiama la procedura fr3 con parametro 7 e memorizza il risultato nella posizione 0 di S
* ◦	La procedura fr3 deve calcolare, in modo ricorsivo, il risultato della funzione matematica F(x), 
*	che ha un parametro intero e produce un risultato intero, definita come:
* ◦		F( x ) = 0 se x <=0
* ◦		F( x ) = 3 se x = 1
* ◦		F( x ) = F( x / 2 ) -2 se x > 1 

* Realizzare 3 versioni del programma, che soddisfino i seguenti requisiti:
* 2 Versione ASM MC68000-ASM1 in cui:
* ⁃ gli interi sono memorizzati in parole di formato word
* ⁃ parametri e risultato sono passati attraverso lo stack
* ⁃ S viene memorizzata in una sequenza di parole allocate staticamente
* ⁃ l'accesso all'elemento di S in posizione 0, 
*	deve avvenire mediante il modo di indirizzamento Indiretto-Registro
* ⁃ l'accesso all'elemento di S in posizione 3, 
*	deve avvenire mediante il modo di indirizzamento Indicizzato

* Versione C
*	int fr3 ( x ) {
*		if( x <= 0)
*			return 0;
*		if( x == 1)
*			return 3;
*		return fr3( x / 2 ) -2;
*	}
	
*	int main (void) {
*		int S[10];
*		S[3] = fr3( 32 );
*		S[0] = fr3( 7 );
*	}

	org $4000
s: ds.w 10

* CORRISPONDENZA
; variabile input -> d0

	org $2000
main_start:
	move.w #32, d0
	move.w d0, -(sp)
	bsr fr3

	move.w (sp)+, d0
	move.l #s, a1
	move.w d0, 3(a1)

	move.w #7, d0
	move.w d0, -(sp)
	bsr fr3

	move.w (sp)+, d0
	move.l #s, a1
	move.w d0, (a1)

main_end:
	bra code_end

* CORRISPONDENZA
; parametro -> d0

fr3:
	move.w (sp)+, d0
	tst d0
	ble if_fr3_0
	cmp.w #1, d0
	beq if_fr3_1

;	return fr3 ( x / 2 ) -2;
	divs #2, d0
	move.w d0, -(sp)
	bsr fr3

	move.w (sp)+, d0
	sub #2, d0
	move.w d0, -(sp)
	rts

if_fr3_0:
	move.w #0, -(sp)
	rts

if_fr3_1:
	move.w #3, -(sp)
	rts

code_end:
	end