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
	lw $s0,0x10010010

# Indirezione: 
# 1) copiare il byte referenziato da s0 in t0
#	usando l'interpretazione di dato signed
# 2) copiare la half referenziata da s0 in t1 
#	usando l'interpretazione di dato unsigned
# 3) copiare la word referenziata da s0 in t2

# Referenziare nel registro s1, le parole il cui indirizzo è
# legato alla label "lab1"

# Indirezione: 
# 1) copiare il byte referenziato da s1 in t0
#	usando l'interpretazione di dato unsigned
# 2) copiare la half referenziata da s1 in t1
#	usando l'interpretazione di dato signed
# 3) copiare la word referenziata da s1 in t2

# Referenziare nel registro s2, le parole il cui indirizzo
# ha distanza +2 rispetto all'indirizzo legato alla label "lab1"

# Indirezione: 
# 1) copiare il byte referenziato da s2 in t0
#	usando l'interpretazione di dato signed
# 2) copiare la half referenziata da s2 in t1
#	usando l'interpretazione di dato signed
# 3) copiare la word referenziata da s2 in t2
