# Il programma seguente è composto da 2 sezioni. La sezione dati è completa, mentre
# nella sezione codice sono presenti solo i commenti che indicano le operazioni
# che il programma deve svolgere. Completare il programma scrivendo le istruzioni
# mancanti.

# Sezione Dati
	.data	0x10010000

inizio_dati:	
	.word	8,48,64,128
	.half	1088,16
	.byte	5,10
lab1:	.byte	9,6,12,18
	.half	4096
	.word	128000,480000

# Sezione Codice
	.text
	

# Referenziare nel registro s0, le parole di indirizzo 0x10010010
	la	$s0,10010010

# Indirezione: 
# 1) copiare il byte referenziato da s0 in t0 usando l'interpretazione di dato signed

	lb	$t0,($s0)

# 2) copiare la half referenziata da s0 in t1 usando l'interpretazione di dato unsigned

	lhu	$t1,($s0)

# 3) copiare la word referenziata da s0 in t2

	lw	$t2,($s0)


# Referenziare nel registro s1, le parole il cui indirizzo è
# legato alla label "lab1"

	la	$s1,lab1

# Indirezione: 
# 1) copiare il byte referenziato da s1 in t0 usando l'interpretazione di dato unsigned

	sbu	$t0,($s1)

# 2) copiare la half referenziata da s1 in t1 usando l'interpretazione di dato signed

	sh 	$t1,($s1)

# 3) copiare la word referenziata da s1 in t2

	sw	$t2,($s1)


# Referenziare nel registro s2, le parole il cui indirizzo
# ha distanza +2 rispetto all'indirizzo legato alla label "lab1"

	la 	$s2,lab1
	mul	$t7,$s3,2
	add	$s3,$s3,$t7

# Indirezione: 
# 1) copiare il byte referenziato da s2 in t0 usando l'interpretazione di dato signed

	sb 	$t0,($s2)

# 2) copiare la half referenziata da s2 in t1 usando l'interpretazione di dato signed

	sh 	$t1,($s2)

# 3) copiare la word referenziata da s2 in t2

	sw	$t2,($s2)
