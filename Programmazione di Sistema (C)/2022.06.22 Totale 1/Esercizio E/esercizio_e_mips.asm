# Esercizio E (8 punti)
# Si scriva un programma C99 con le seguenti caratteristiche:
#   . definisce un tipo aggregato T formato da due membri di tipo char di nome c1 e c2, un
#     membro di tipo long di nome x e un membro di tipo int di nome y (l'ordine dei membri può
#     essere scelto come rivuole, per facilitare la traduzione in ASM)
#   . definisce un array a di lunghezza 10 di elementi di tipo T
#   . esegue un ciclo in cui chiede all'utente di inserire i dati da memorizzare in a
#   . ordina a in base ai valori crescenti dei membri c1 degli elementi (ovvero un elemento h viene
#     considerato minore di un elemento k se e solo se il membro c1 di h è minore del membro c1
#     di k)
#   . stampa, uno alla volta, gli elementi di a
# 
# Per ordinare a, il programma il seguente algoritmo (chiamato Insertion Sort)
#   . Per j che va da 2 a 10, ripeti:
#     - key assume a[ j ]
#     - i assume j - 1
#     - mentre i > 0 e a[ i ] > key, ripeti:
#       - a[ i + 1 ] assume a[ i ]
#       - i assume i - 1
#     - a[ i + 1 ] assume key

# Per la versione MIPS32-MARS, usare
#     il formato byte per rappresentare il tipo char
#     il formato half per rappresentare il tipo int
#     il formato word per rappresentare il tipo long

# Nel rappresentare il tipo aggregato T, si presti attenzione ai vincoli di allineamento: per evitare
# problemi si consiglia di scegliere in modo opportuno l'ordine dei membri all'interno dell'area di
# memoria che rappresenta un valore di T.
# Entrambe le versioni assembly, per effettuare input/output usare delle parole magiche, ovvero delle
# parole di memoria speciali, accedendo alle quali l'hardware effettua operazioni input/output. In
# particolare:
#   - l'input di un carattere avviene leggendo il contenuto della parola di 8 bit che ha indirizzo
#      0x6000
#   - l'output di un carattere avviene scrivendo il carattere nella parola di 8 bit che ha indirizzo
#      0x6001
#   - l'input di un intero di 16 cifre binarie avviene leggendo il contenuto della parola di 16 bit che
#      ha indirizzo 0x7000
#   - l'output di un intero di 16 cifre binarie avviene scrivendolo nella parola di 16 bit che ha
#      indirizzo 0x7002
#   - l'input di un intero di 32 cifre binarie avviene leggendo il contenuto della parola di 32 bit che
#      ha indirizzo 0x8000
#   - l'output di un intero di 32 cifre binarie avviene scrivendolo nella parola di 32 bit che ha
#     indirizzo 0x8004

.eqv i_char 0x00006000
.eqv o_char 0x00006001
.eqv i_int_16 0x00007000
.eqv o_int_16 0x00007002
.eqv i_int_32 0x00008000
.eqv o_out_32 0x00008004

	.data
c1:	.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
c2:	.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
x:	.long 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
y:	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

	.text
main_start:
	li $t0, 0
for_1_start:
	bgez $t0, for_1_end

	la $a0, c1
	la $a1, c2
	la $a2, x
	la $a3, y

	lb $t1, i_char
	lb $t2, i_char
	lw $t3, i_int_32
	lh $t4, i_int_16

	sb $t1, $t0($a0)
	sb $t2, $t0($a1)
	sw $t3, $t0($a2)
	sh $t4, $t0($a3)

	add $t0, $t0, 1
	j for_1_start

for_1_end:
	li $t0, 0
	li $s1, 0
	li $t1, 2

for_2_start:
	ble $t1, 2, for_2_end
	bge $t1, 10, for_2_end

	add $a0, $a0, $t1
	lh $s1, ($a0)
	sub $t0, $t1, 1

while_start:
	blez $t0, while_end
	la $a0, c1
	add $a0, $a0, $t0
	lw $t2, ($a0)
	ble $t2, $s1, while_end

	add $t4, $t0, 1
	la $a5, c1
	add $a0, $a0, $t0
	add $a5, $a5, $t1
	lb $t4, ($a0)
	lb $t4, ($a1)
# E così via per $a1, $a2, $a3

	sub $t0, $t0, 1

while_end:
	add $t4, $t0, 1
	la $a0, c1
	add $a0, $a0, $t4
	sb $s1, ($a0)

	add $t0, $t0, 1
	j for_2_start

for_2_end:
	li $t0, 0

for_3_start:
	bge $t0, 10, for_3_end
	la $a0, c1
	add $a0, $a0, $t0
	lw $t5, ($a0)
	la $a5, o_char
	sw $t5, ($a5)
#	e così via

	add $t0, $t0, 1
	j for_3_start

for_3_end:
