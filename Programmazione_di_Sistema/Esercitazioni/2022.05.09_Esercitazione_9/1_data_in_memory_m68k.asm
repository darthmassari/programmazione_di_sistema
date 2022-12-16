* equ è l'equivalente di evq in mars
* [alias] equ [indirizzo]

* long
v equ $00002800
w equ $00002804

* short signed, unsigned
x equ $00002810 ; salto di più per una questione di allineamento(?)
y equ $00002812
z equ $00002814
h equ $00002816
k equ $00002818
m equ $0000281a

* signed char
a equ $0000281c
b equ $0000281d
c equ $0000281e

org $2000
inizio_codice:

* b = 'A';
	move.b #'A', b	; il compilatore sostituisce
					; a b l'indizizzo $0000281d

* c = -43;
	move.b #-43, c

* e così via
* ......
*	move.w d0, h

* v = w - 160900 - h;
* h (d0) non viene convertito implicitamente in long, bisogna farlo manualmente
	move.l w, v
	sub.l #160900, v
	ext.l d0		; converto h (d0) in long
	sub.l d0, v

* h = 780;
	move.w #780, h

* k = -24078 % m + 4 * h;
	move.l #-24078, d0
	divs m, d0
	swap d0			; mi serve il resto, scambio quoziente e resto
	move.w h, d1
	asl.w #2, d1	; altro modo per fare la moltiplicazione
	add.w d1, d0
	move.w d0, k

fine_codice:
END