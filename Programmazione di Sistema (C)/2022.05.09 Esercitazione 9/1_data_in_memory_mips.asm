# long - 32 bit
.eqv var_v, 0x10011000 # permette di dare un nome ad un registro
.eqv var_w, 0x10011004

# short signed, unsigned - 16 bit
.eqv var_x, 0x10011008
.eqv var_y, 0x1001100a	# stiamo lavorando sulle half, occupano 16 bit, saltiamo di 2
.eqv var_z, 0x1001100c
.eqv var_h, 0x1001100e
.eqv var_k, ox10011010
.eqv var_m, 0x10011012

#signed char - 8 bit
.eqv var_a, 0x10011014	# l'indirizzo precedente occupa 2 posti, avanzo di 2
.eqv var_b, 0x10011015	# signed char occupano 8 bit, salto di 1
.eqv var_c, 0x10011016

.text
inizio_codice:

# b = 'A';
	li	$t0, 'A'
	sb	$t0, var_b

# c = -43;
	li 	$t0, -43
	sb	$t0, var_c

# e così via
	li 	$t0, 450
	sh 	$t0, var_x	# sh perchè uso half

	li 	$t0, 98
	sh 	$t0, var_z

	li 	$t0, 220200
	sw	$t0, var_w 	# sw perchè uso word

	li 	$t0, 600
	sh 	$t0, var_k

	li 	$t0, 12
	sh 	$t0, var_m

# a = b +c;
	lb 	$t0, var_b
	lb 	$t1, var_c
	add	$t0, $t0, $t1
	sb 	$t0, var_a

# y = x * z + 2300;
	lhu	$t0, var_x
	lhu	$t1, var_z
	multu	$t0, $t1
	mflo	$t0
	addu	$t0, $t0, 2300
	sh 	$t0, var_y

# h = k * a + m;
# c'è una conversione implicita, perché a è signed
# char, viene convertito a short prima dell'operazione
	lb 	$t0, var_a
	lh 	$t1, var_k
	mult 	$t0, $t1
	mflo	$t1
	lh 	$t0, var_m
	add	$t0, $0, $t1
	sh 	$t0, var_h

# v = w - 160900 - h;
# h viene implicitamente convertito in long perché
# gli altri operandi sono word
	lw	$t1, var_w
	sub	$t1, $t1, 160900
	sub	$t1, $t1, $t0
	sw	$t1, var_v

# h = 780;
	li	$t0, 780
	sh 	$t0, var_h

# h = -24078 % m + 4 * h;
	li 	$t1, -24078
	lh 	$t2, var_m
	div	$t1, $t2
	mfhi	$t1
	sll	$t0, $t0, 2 	# altro modo per fare la moltiplicazione
	add	$t1, $t1, $t0
	sh 	$t1, var_k

fine_codice: