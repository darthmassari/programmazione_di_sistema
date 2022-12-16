* Completare LPS22-L15-V2-m68k, traducendo interamente la versione C del programma 
* in un codice MC68000 nel quale gli indirizzi di memoria sono rappresentati mediante nomi simbolici

* Trasforma una parte di un programma Plain C in MC68000, immagazzinando dati
; in memoria e rappresentando gli indirizzi mediante nome simbolici

* La direttiva EQU permette di definire una stringa come alias di un valore numerico

* Stabiliamo la corrispondenza tra variabili della versione Ref-pc e parole di
* memoria m68k, definendo nomi simbolici uguali ai nomi delle variabili
* a ciascuna variabile long corrisponde una LONG (32 bit) di memoria
v	equ	$00002800	
w	equ	$00002804
* a ciascuna variabile short (signed o unsigned) corrisponde una WORD (16 bit) di memoria
x	equ $00002810
y	equ	$00002812
z	equ $00002814
h	equ $00002816
k	equ	$00002818
m	equ	$0000281a
* a ciascuna variabile signed char corrisponde un BYTE (8 bit) di memoria
a	equ $0000281c
b	equ $0000281d
c	equ $0000281e


	org	$2000
inizio_codice:

; signed char a, b = 'A', c = -43;
	move.b	#'A',b
	move.b	#-43,c

; unsigned short x = 450, y, z = 98;
	move.w	#450,x
	move.w	#98,z

; long v, w = 220200;
	move.l	#220200,w

; signed short h, k = 600, m = 12;
	move.w	#600,k
	move.w	#12,m

;	a = b + c;
	move.b	b,d0
	add.b	c,d0
	move.b	d0,a

;	y = x * z + 2300;
	move.w	z,d0
	mulu	x,d0
	add.w	#2300,d0
	move.w	d0,y

;	h = k * a + m;
	move.b	a,d0			; copia il byte che rappresenta a in d0
	ext.w	d0				; converte il byte d0 in word con sign extension
	muls	k,d0			; d0 contiene k * a
	add.w	m,d0
	move.w	d0,h

; FINE CODICE PROFESSORE

;	v = w - 160900 - h;
	move.l	h,d0
	ext.l 	d0
	sub.l	#160900,d0
	sub.l 	w,d0
	move.l 	d0,v

;	h = 780;
	move.w 	#780, h

;	k = -24078 % m + 4 * h;
	move.w 	m,d0
	divs 	#24078,d0
	swap.w 	d0
	move.w 	h,d1
	muls 	#4,d1
	add.w 	d0,d1
	move.w 	d1,k


fine_codice:
	end
	
	
