# Esercizio E (8 punti)
# Si scriva, in C99, MIPS32-MARS e MC68000, un programma con le seguenti caratteristiche:
#   . definisce un tipo aggregato T formato dai seguenti membri (disposti nell'ordine che si
#     preferisce, per facilitare la traduzione in ASM):
#     - 5 membri di un tipo in grado di memorizzare interi nell'intervallo [-32768, 32767], di
#       nome s1, s2, s3, s4, s5
#     - 2 membri di un tipo in grado di memorizzare interi nell'intervallo [-128, 127], di nome
#       c1, c2
#     - 1 membro di un tipo in grado di memorizzare interi nell'intervallo [-2^31, 2^31-1], di
#       nome m
#   . definisce un array a di lunghezza 12 di elementi di tipo T (indici numerati a partire da 0)
#   . definisce un array b di lunghezza 12 di elementi di un tipo in grado di memorizzare interi
#     nell'intervallo [-128, 127] (gli indici sono numerati a partire da 0)
#   . esegue un ciclo in cui chiede all'utente di inserire i dati da memorizzare in a
#   . per ciascun indice j valido per a, ripete
#     - h assume il valore del membro c2 di a[ j ]
#     - se h è un indice valido per a, allora
#       - conta quanti dei membri s1, s2, s3, s4, s5 di a[ h ] sono maggiori del membro
#         m di a[ j ]
#       - b[ j ] assume il risultato del conteggio fatto al passo precedente
#     - altrimenti b[ j ] assume -1
#   . stampa, uno alla volta, gli elementi di b

# Per la versione MIPS32-MARS, usare
#     il formato byte per rappresentare il tipo char
#     il formato half per rappresentare il tipo int
#     il formato word per rappresentare il tipo long

# Nel rappresentare il tipo aggregato T, si presti attenzione ai vincoli di allineamento: per evitare
# problemi si consiglia di scegliere in modo opportuno l'ordine dei membri all'interno dell'area di
# memoria che rappresenta un valore di T.
# Nelle versioni ASM, per effettuare input/output, usare delle parole magiche, ovvero delle
# parole di memoria speciali, accedendo alle quali l'hardware effettua operazioni input/output. In particolare:
#   - l'input di un byte avviene leggendo il contenuto della parola di 8 bit che ha indirizzo
#      0x6000
#   - l'output di un byte avviene scrivendo il carattere nella parola di 8 bit che ha indirizzo
#      0x6001
#   - l'input di un valore di 16 cifre binarie avviene leggendo il contenuto della parola di 16 bit che
#      ha indirizzo 0x7000
#   - l'output di un valore di 16 cifre binarie avviene scrivendolo nella parola di 16 bit che ha
#      indirizzo 0x7002
#   - l'input di un valore di 32 cifre binarie avviene leggendo il contenuto della parola di 32 bit che
#      ha indirizzo 0x8000
#   - l'output di un valore di 32 cifre binarie avviene scrivendolo nella parola di 32 bit che ha
#     indirizzo 0x8004



.eqv i_char 0x00006000
.eqv o_char 0x00006001
.eqv i_int 0x00007000
.eqv o_int 0x00007002
.eqv i_long 0x00008000
.eqv o_long 0x00008004

	.data 0x10010000
c1:	.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
c2:	.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
s1:	.half 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
s2:	.half 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
s3:	.half 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
s4:	.half 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
s5:	.half 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
m:	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

b:	.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

	.text
main_start:
	li $t0, 0 	# i

for_1_start:
	bge $t0, 12, for_1_end

	la $a1, c1
	lb $t1, i_char
	add $a1, $a1, $t0
	sb $t1, ($a1)
	la $a1, c2
	lb $t1, i_char
	add $a1, $a1, $t0
	sb $t1, ($a1)
	la $a1, s1
	lh $t1, i_int
	add $a1, $a1, $t0
	sh $t1, ($a1)
	la $a1, s2
	lh $t1, i_int
	add $a1, $a1, $t0
	sh $t1, ($a1)
	la $a1, s3
	lh $t1, i_int
	add $a1, $a1, $t0
	sh $t1, ($a1)
	la $a1, s4
	lh $t1, i_int
	add $a1, $a1, $t0
	sh $t1, ($a1)
	la $a1, s5
	lh $t1, i_int
	add $a1, $a1, $t0
	sh $t1, ($a1)
	la $a1, m
	lw $t1, i_long
	add $a1, $a1, $t0
	sw $t1, ($a1)

	add $t0, $t0, 1
	j for_1_start

for_1_end:
	li $s0, 0 	# h
	li $s1, 0 	# k
	li $t1, 0 	# j

for_2_start:
	bge $t1, 12, for_2_end

	la $a1, c2
	add $a1, $a1, $t1
	lw $s0, ($a1)

	la $a3, b
	add $a3, $a3, $t1

if_main:
	bge $s0, 12, if_main_false

	la $a1, m
	add $a1, $a1, $t1
	lw $t2, ($a1)
	la $a2, s1
	add $a2, $a2, $s0
	ble $a2, $t2, if_1_false
	add $s1, $s1, 1
if_1_false:
	la $a2, s1
	add $a2, $a2, $s0
	ble $a2, $t2, if_1_false
	add $s1, $s1, 1
if_2_false:
	la $a2, s2
	add $a2, $a2, $s0
	ble $a2, $t2, if_1_false
	add $s1, $s1, 1
if_3_false:
	la $a2, s3
	add $a2, $a2, $s0
	ble $a2, $t2, if_1_false
	add $s1, $s1, 1
if_4_false:
	la $a2, s4
	add $a2, $a2, $s0
	ble $a2, $t2, if_1_false
	add $s1, $s1, 1
if_5_false:
	la $a2, s5
	add $a2, $a2, $s0
	ble $a2, $t2, if_1_false
	add $s1, $s1, 1

	sw $s1, ($a3)
	add $t1, $t1, 1
	j for_2_start

if_main_false:
	li $t5, 1
	sw $t5, ($a3)
	add $t2, $t1, 1
	j for_2_start

for_2_end:
	li $t0, 0

for_3_start:
	bge $t0, 12, for_3_end
	la $a3, b
	add $a3, $a3, $t0
	lb $t6, ($a3)
	sb $t6, o_char
	add $t1, $t1, 1
	j for_3_start

for_3_end: