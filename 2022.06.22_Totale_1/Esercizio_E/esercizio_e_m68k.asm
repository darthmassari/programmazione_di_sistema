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

# Per la versione MC68000-ASM, usare
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


i_char equ $00006000
o_char equ $00006001
i_int equ $00007000
o_int equ $00007002
i_long equ $00008000
o_long equ $00008004

	org $4000
c1: ds.b 10
c2: ds.b 10
y: ds.w 10
x: ds.l 10

	org $2000
main_start:
	clr.w d0
for_1_start:
	cmp.w 10, d0
	bge for_1_end

	move.l #c1, a0
	move.l #c2, a1
	move.l #x, a2
	move.l #y, a3

	move.b i_char, (a0, d0.b)
	move.b i_char, (a1, d0.b)
	move.l i_int, (a2, d0.w)
	move.l i_long, (a3, d0.l)

	add.w #1, d0
	bra for_1_start

for_1_end:
	clr.w d0
	clr.w d1
	move.w #2, d2

for_2_start:
	cmp.w #2, d2
	ble for_2_end
	cmp.w #10, d2
	bge for_2_end

	move.b (a0, d2.b), d1
	move.w d2, d3
	sub #1, d3
	move.w d3, d0

while_start:
	tst d0
	ble while_end
	move.w (a0, d0.b), d3
	cmp.w d1, d3
	ble while_end

	move.w d0, d5
	add #1, d5
	move.b (a0, d0.b), (a0, d5.b)
	move.b (a1, d0.b), (a1, d5.b)
	move.l (a2, d0.l), (a2, d5.l)
	move.w (a3, d0.w), (a3, d5.w)

	sub #1, d0

while_end:
	move.w d0, d3
	add.w #1, d3
	move.b d1, (a0, d3.b)

	add.w #1, d0
	bra for_2_start

for_2_end:
	clr d0

for_3_start:
	cmp.w #10, d0
	bge for_3_end
	move.b (a0, d0.b), o_char
	move.b (a1, d0.b), o_char 
	move.l (a2, d0.w), o_int
	move.l (a3, d0.l), o_long 
	
	add.w #1, d0
	bra for_3_start

for_3_end:
	end