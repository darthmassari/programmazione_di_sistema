* Realizzare 3 versioni del programma, che soddisfino i seguenti requisiti:
* 2 Versione ASM MC68000-ASM1 in cui:
*	⁃ gli interi sono memorizzati in parole di formato word
*	⁃ parametri e risultato sono passati attraverso registri

* Si scriva un programma con le seguenti caratteristiche:
* ◦ La procedura principale del programma chiama la procedura fr1 con parametro 22
* ◦ La procedura fr1 deve calcolare, in modo ricorsivo, il risultato della
*	funzione matematica F(x), che ha un parametro intero e produce un
*	risultato intero, definita come:
*		◦ F( x ) = 0 se x <=0
*		◦ F( x ) = 3 se x = 1
*		◦ F( x ) = F( x / 3 ) + x se x > 1

* C

*	int fr1 ( int x ) {
*		if( x <= 0 )
*			return 0;
*		if( x == 1 )
*			return 3;
*		return fr1( x / 3 ) + x;
*	}

*	int r, x = 22;

*	int main (void) {
*		r = fr1 ( x );
*		printf("Risultato: %d", r);
*	}


* MC6800-ASM1

* Dichiarazione variabili esterne 
	org $4000
x:	dc.w 22
r:	dc.w 0

	org $2000
code_start:

main_start:
	move.w x,d0
	bsr fr1
	move.w d1,r
	
main_end:
	bra code_end

fr1:
	tst d0
	ble if_fr1_0
	cmp.w #1,d0
	beq if_fr1_1
	bgt if_fr1_2
	add.w d0,d1
	rts

if_fr1_0:
	move.w #0,d1
	rts

if_fr1_1:
	move.w #3,d1
	rts

if_fr1_2:
	move.w d0,d1
	divs #3,d0
	bsr fr1

code_end:
	end