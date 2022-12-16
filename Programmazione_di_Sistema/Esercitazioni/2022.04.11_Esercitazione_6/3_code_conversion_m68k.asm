; d0, d1, d2, d3, d4 = n, a, b, c, d
; d7 = i
; = t1

org $2000

;var in registers: d0, d2, d4

move.w #1, d1
clr.w d7

for_begin:
	cmp.w d0,d7
	bge for_end

	move.w d7,d6
	ext.l d6
	divs #2,d6		;il quoziente è memorizzato nei primi 16 				 ;bit di d6
	move.w d6,d3	;sposto il quoziente in c

	move.w d2,d6
	ext.l d6
	divs #7,d6		;il resto è contenuto negli ultimi 16 bit
	swap d6			;scambio per ottenere il restp
	move.w d6,d4	;sposto il resto in d

	cmp.w #1,d4
	beq for_continue

do_begin:
	sub.w d1,d4
	add.w d2,d3

	cmp.w #38,d3
	blt do_begin

	tst.w d4		;confronta con zero (cmp.w #0,d4)
	bgt do_begin

move.w d3,d6
ext.l d6
divs d1,d6
move.w d6,d3
	
move.w d3,d6
add.w #5,d6

cmp.w d6,d2
bge for_end

sub.w #1,d2

for_continue:
	add.w #1,d7
	add.w d7,d1

	bra for_begin

for_end:
	;output d1, d2

END