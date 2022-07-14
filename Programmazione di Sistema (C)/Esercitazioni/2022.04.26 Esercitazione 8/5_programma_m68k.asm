* 5 Scrivere un programma che soddisfa la specifica 
* riportata sotto
 
* c) assembly MC68000-ASM1 (simulare input/output con 
* copie da/a registro A0 verso/da altri registri)
 
* Specifica
* ⁃ LEGGERE da input un intero senza segno x
* ⁃ SE x è minore di 256 ALLORA
* ⁃		CONTARE quante cifre binarie di x hanno valore 1
* ⁃		STAMPARE in output il numero trovato
* ⁃ TERMINARE

* d1 = x
	
	move.w	#$4c,a0		;$4c = 0100 1100
	move.w	a0,d1
	cmp.w	#256,d1
	bhs	fine_codice		;se x >= 256, salta a fine codice	

	clr.b d0		;contatore, inizia da 0	
	move.b  #$01,d3	;maschera
	clr.b d6		;contatore di ciclo	

loop:
	move.w	d1,d2	;copia di x
	and.b	d3,d2		;in d2 seleziono solo la cifra
						;di posizione 0
	beq		no_in	
	add.b 	#1,d0	;incrementa contatore

no_inc:
	lsl.b 	#1,d3	;faccio lo shift
	add.b 	#1,d6	;aggiungo l'occorrenza al contatore
					;di ciclo
	cmp.b 	#8,d6	;8 è il valore limite del ciclo
	blo		loop

	;d0 contiene il numero di cifre di valore 1 in d1
	
fine_codice: