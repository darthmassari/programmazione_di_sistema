* Completare LPS22-L15-V1-m68k, traducendo interamente la versione C del programma 
* (ovvero la versione Ref-pc) in un codice MC68000 nel quale gli indirizzi di memoria 
* sono rappresentati mediante numeri esadecimali

* Trasforma una parte di un programma Plain C in MC68000, immagazzinando dati
; in memoria e rappresentando gli indirizzi mediante numeri

* Corrispondenza tra variabili della versione Ref-pc e parole di memoria m68k
* a ciascuna variabile long corrisponde una LONG (32 bit) di memoria
; v -> $00002800
; w -> $00002804
* a ciascuna variabile short (signed o unsigned) corrisponde una WORD (16 bit) di memoria
; x -> $00002810
; y -> $00002812
; z -> $00002814
; h -> $00002816
; k -> $00002818
; m -> $0000281a
* a ciascuna variabile signed char corrisponde un BYTE (8 bit) di memoria
; a -> $0000281c
; b -> $0000281d
; c -> $0000281e


	org	$2000
inizio_codice:

; signed char a, b = 'A', c = -43;
	move.b	#'A',$0000281d
	move.b	#-43,$0000281e

; unsigned short x = 450, y, z = 98;
	move.w	#450,$00002810
	move.w	#98,$00002814

; long v, w = 220200;
	move.l	#220200,$00002804

; signed short h, k = 600, m = 12;
	move.w	#600,$00002818
	move.w	#12,$0000281a

;	a = b + c;
	move.b	$0000281d,d0
	add.b	$0000281e,d0
	move.b	d0,$0000281c

;	y = x * z + 2300;
	move.w	$00002814,d0
	mulu	$00002810,d0
	add.w	#2300,d0
	move.w	d0,$00002812

;	h = k * a + m;
	move.b	$0000281c,d0	; copia il byte che rappresenta a in d0
	ext.w	d0				; converte il byte d0 in word con sign extension
	muls	$00002818,d0	; d0 contiene k * a
	add.w	$0000281a,d0
	move.w	d0,$00002816

; FINE CODICE PROFESSORE

;	v = w - 160900 - h;
	move.l	$00002816,d0
	ext.l 	d0
	sub.l	#160900,d0
	sub.l 	$00002804,d0
	move.l 	d0,$00002800

;	h = 780;
	move.w 	#780, $00002816

;	k = -24078 % m + 4 * h;
	move.w 	$0000281a,d0
	divs 	#24078,d0
	swap.w 	d0
	move.w 	$00002816,d1
	muls 	#4,d1
	add.w 	d0,d1
	move.w 	d1,$00002818

fine_codice:
	end
	
	
