# Unsigned char con byte
# Int con half
# Long con word

# posso memorizzare una variabile di tipo struct tipo con:
#	1 word, 2 byte, 1 half
# definisco dei nomi simbolici per gli offset dei vari  
# membri rispetto all'indirizzo del primo membro
	.eqv	off_a,0
	.eqv 	off_b,4
	.eqv	off_c,5
	.eqv	off_d,6

	.data	0x10010000

s1:	.word	12800
	.byte	'Z',250
	.half	450

s2:	.word	0
	.byte	0,0
	.half	0

# ps2:	.word	s2	potrei fare così, ma...
# ...I contatori conviene metterli direttamente nei registri perchè
# ho bisogno di utilizzare l'indirizzamento indiretto-registro

	.text
code_start:

# t1 = ps1, non inizialittato
# t2 = ps2, inizializzato con &s2

#	*ps2 = &s2
	la 	$t2,s2

#	s1.b = 'X';
	la	$t0,s1 		# t0 contiene l'indirizzo s1
					# s1.b si trova all'indirizzo s1+4
	li 	$t3,'X'
#	sb	$t3,4($t0) 	# uso 4 come offset
					# un modo più elegante è definire dei nomi
					# simbolici per gli offset, diventa
	sb 	$t3,off_b($t0)

#	s2 = s1;
# posso fare caso che s1 (e s2) occupano 2 word ciascuno,
# copio 2 word a partire da s1 all'indirizzo a partire da s2
	lw	$t4,s1
	sw	$t4,s2
	lw	$t4,s1+4
	sw	$t4,s2+4

#	s2.a = 96000;
	la 	$t5,s2 			# t5 contiene l'indirizzo s2
	lw 	$t4,off_a($t5)
	add	$t4,$t4,96000
	sw 	$t4,off_a($t5)

#	s2.c += s1.b;
	lbu	$t3,off_b($t0)
	lbu	$t4,off_c($t5)
	add	$t4,$t4,$t3
	sb 	$4,off_c($t5)

#	(*ps2).d *= 3;
	lh	$t3,off_d($t2)
	mul	$t3,$t3,3
	sh	$t3,off_d($t2)

#	ps1 = ps2;
	move	$t1,$t2		# adesso puntano alla stessa struttura

#	ps1 -> a = -88000;
	li 	$t3,-88000
	sw	$t3,off_a($t1)

#	ps1 = &s1;
	la 	$t1,s1

#	*ps2 = *ps1;
# copio l'oggetto puntato da ps1 nell'oggetto puntato da ps2
# copio 2 word a partire dall'indirizzo contenuto in t1
# all'indirizzo contenuto in t2
	lw 	$t4,($t1)
	sw	$t4,($t2)
	lw	$t4,4($t1)
	sw	$t4,($t2)