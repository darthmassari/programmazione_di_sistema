# Realizzare una traduzione della versione C del programma in un codice MIPS32 
# nel quale gli indirizzi di memoria sono rappresentati mediante nomi simbolici

# Corrispondenza tra variabili della versione Ref-pc e parole di memoria MIPS32
# a ciascuna variabile long corrisponde una WORD (32 bit) di memoria
.eqv	var_v,0x10011000
.eqv	var_w -> 0x10011004
# a ciascuna variabile short (signed o unsigned) corrisponde una HALF (16 bit) di memoria
.eqv	var_x,0x10011008
.eqv	var_y,0x1001100a
.eqv	var_z,0x1001100c
.eqv	var_h,0x1001100e
.eqv	var_k,0x10011010
.eqv	var_m,0x10011012
# a ciascuna variabile signed char corrisponde un BYTE (8 bit) di memoria
.eqv	var_a,0x10011014
.eqv	var_b,0x10011015
.eqv	var_c,0x10011016

.text
inizio_codice:
# signed char a, b = 'A', c = -43;
	li $t0,'A'
	sb $t0,var_b
	li $t0,-43
	sb $t0,var_c

# unsigned short x = 450, y, z = 98;
	li $t0,450
	sh $t0,var_x
	li $t0,98
	sh $t0,var_z

# long v, w = 220200;
	li $t0,220200
	sw $t0,var_w

# signed short h, k = 600, m = 12;
	li $t0,600
	sh $t0,var_k
	li $t0,12
	sh $t0,var_m

#	a = b + c;
	lb $t0,var_b
	lb $t1,var_c
	add $t0,$t0,$t1
	sb $t0,var_a

#	y = x * z + 2300;
	lhu $t0,var_x
	lhu $t1,var_z
	multu $t0,$t1
	mflo $t0
	addu $t0,$t0,2300
	sh $t0,var_y

#	h = k * a + m;
	lh $t0,var_k
	lb $t1,var_a
	mult $t0,$t1
	mflo $t0
	lh $t1,var_m
	add $t0,$t0,$t1
	sh $t0,var_h

#	v = w - 160900 - h;
	lw $t1,var_w
	sub $t1,$t1,160900
	sub $t1,$t1,$t0
	sw $t1,var_h

# 	h = 780;
	li $t0,780
	sh $t0,var_h

#	k = -24078 % m + 4 * h;
	lh $t1,var_m
	li $t2,-24078
	div $t1,$t2
	mfhi $t1
	mult $t0,$t0,4
	add $t0,$t0,$t1
	sh $t0,var_k