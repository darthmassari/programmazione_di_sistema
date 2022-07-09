# Realizzare una traduzione della versione C del programma in un codice MIPS32 
# nel quale gli indirizzi di memoria sono rappresentati mediante numeri esadecimali

# Corrispondenza tra variabili della versione Ref-pc e parole di memoria MIPS32
# a ciascuna variabile long corrisponde una WORD (32 bit) di memoria
# v -> 0x10011000
# w -> 0x10011004
# a ciascuna variabile short (signed o unsigned) corrisponde una HALF (16 bit) di memoria
# x -> 0x10011008
# y -> 0x1001100a
# z -> 0x1001100c
# h -> 0x1001100e
# k -> 0x10011010
# m -> 0x10011012
# a ciascuna variabile signed char corrisponde un BYTE (8 bit) di memoria
# a -> 0x10011014
# b -> 0x10011015
# c -> 0x10011016

.text
inizio_codice:

# signed char a, b = 'A', c = -43;
	li 	$t0,'A'
	sb 	$t0,0x10011015
	li 	$t0,-43
	sb	$t0,0x10011016

# unsigned short x = 450, y, z = 98;
	li 	$t0,450
	sh 	$t0,0x10011008
	li 	$t0,98
	sh 	$t0,0x1001100c

# long v, w = 220200;
	li 	$t0,220200
	sw	$t0,0x10011004

# signed short h, k = 600, m = 12;
	li 	$t0,600
	sh 	$t0,0x10011010
	li 	$t0,12
	sh 	$t0,0x10011012

#	a = b + c;
	lb	$t0,0x10011015
	lb	$t1,0x10011016
	add	$t0,$t0,$t1
	sb	$t0,0x10011014

#	y = x * z + 2300;
	lhu	$t0,0x10011008
	lhu	$t1,0x1001100c
	multu	$t0,$t1
	mflo	$t0
	addu	$t0,$t0,2300
	sh 	$t0,0x1001100a

#	h = k * a + m;
	lh 	$t0,0x10011010
	lb 	$t1,0x10011014
	mult 	$t0,$t1
	mflo	$t0
	lh 	$t1,0x10011012
	add	$t0,$t0,$t1
	sh 	$t0,0x1001100e

#	v = w - 160900 - h;
	lw	$t1,0x10011004
	sub	$t1,$t1,160900
	sub	$t1,$t1,$t0		# ho già una copia di w in t0
	sw	$t0,0x10011000

# 	h = 780;
	li 	$t0,780
	sh 	$t0,0x1001100e

#	k = -24078 % m + 4 * h;
	lh 	$t1,0x10011012
	li 	$t2,-24078
	div	$t1,$t2
	mfhi	$t1
	li 	$t2,4
	mult 	$t0,$t2		# mult vuole due registri
	add	$t1,$t1,$t0
	sh 	$t1,0x10011010

fine_codice: