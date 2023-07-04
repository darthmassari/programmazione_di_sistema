* Esercizio E (8 punti)
* Si scriva, in C99, MIPS32-MARS e MC68000, un programma con le seguenti caratteristiche:
*   . definisce un tipo aggregato T formato dai seguenti membri (disposti nell'ordine che si
*     preferisce, per facilitare la traduzione in ASM):
*     - 5 membri di un tipo in grado di memorizzare interi nell'intervallo [-32768, 32767], di
*       nome s1, s2, s3, s4, s5
*     - 2 membri di un tipo in grado di memorizzare interi nell'intervallo [-128, 127], di nome
*       c1, c2
*     - 1 membro di un tipo in grado di memorizzare interi nell'intervallo [-2^31, 2^31-1], di
*       nome m
*   . definisce un array a di lunghezza 12 di elementi di tipo T (indici numerati a partire da 0)
*   . definisce un array b di lunghezza 12 di elementi di un tipo in grado di memorizzare interi
*     nell'intervallo [-128, 127] (gli indici sono numerati a partire da 0)
*   . esegue un ciclo in cui chiede all'utente di inserire i dati da memorizzare in a
*   . per ciascun indice j valido per a, ripete
*     - h assume il valore del membro c2 di a[ j ]
*     - se h è un indice valido per a, allora
*       - conta quanti dei membri s1, s2, s3, s4, s5 di a[ h ] sono maggiori del membro
*         m di a[ j ]
*       - b[ j ] assume il risultato del conteggio fatto al passo precedente
*     - altrimenti b[ j ] assume -1
*   . stampa, uno alla volta, gli elementi di b

* Per la versione MC68000-ASM1, usare
*   - byte per il tipo in grado di memorizzare interi nell'intervallo [-128, 127]
*   - word per il tipo in grado di memorizzare interi nell'intervallo [-32768, 32767]
*   - long per il tipo in grado di memorizzare interi nell'intervallo [-2^31, 2^31-1]

* Nel rappresentare il tipo aggregato T, si presti attenzione ai vincoli di allineamento: per evitare
* problemi si consiglia di scegliere in modo opportuno l'ordine dei membri all'interno dell'area di
* memoria che rappresenta un valore di T.
* Nelle versioni ASM, per effettuare input/output, usare delle parole magiche, ovvero delle
* parole di memoria speciali, accedendo alle quali l'hardware effettua operazioni input/output. In particolare:
*   - l'input di un byte avviene leggendo il contenuto della parola di 8 bit che ha indirizzo
*      0x6000
*   - l'output di un byte avviene scrivendo il carattere nella parola di 8 bit che ha indirizzo
*      0x6001
*   - l'input di un valore di 16 cifre binarie avviene leggendo il contenuto della parola di 16 bit che
*      ha indirizzo 0x7000
*   - l'output di un valore di 16 cifre binarie avviene scrivendolo nella parola di 16 bit che ha
*      indirizzo 0x7002
*   - l'input di un valore di 32 cifre binarie avviene leggendo il contenuto della parola di 32 bit che
*      ha indirizzo 0x8000
*   - l'output di un valore di 32 cifre binarie avviene scrivendolo nella parola di 32 bit che ha
*     indirizzo 0x8004


i_char equ $00006000
o_char equ $00006001
i_int equ $00007000
o_int equ $00007002
i_long equ $00008000
o_long equ $00008004

	org $4000
c1: ds.b 12
c2: ds.b 12
s1: ds.w 12
s2: ds.w 12
s3: ds.w 12
s4: ds.w 12
s5: ds.w 12
m: ds.l 12

b: ds.b 12

	org $2000
main_start:
	clr.w d0	; i

for_1_start:
	cmp.w #12, d0
	bge for_1_end

	move.l #c1, a1
	move.b i_char, (a1, d0)
	move.l #c2, a1
	move.b i_char, (a1, d0)
	move.l #s1, a1
	move.w i_int, (a1, d0)
	move.l #s2, a1
	move.w i_int, (a1, d0)
	move.l #s3, a1
	move.w i_int, (a1, d0)
	move.l #s4, a1
	move.w i_int, (a1, d0)
	move.l #s5, a1
	move.w i_int, (a1, d0)
	move.l #m, a1
	move.l i_long, (a1, d0)

	add #1, d0
	bra for_1_start

for_1_end:
	clr.w d1	; h
	clr.w d2	; k
	clr.w d3	; j

for_2_start:
	cmp.w #12, d3
	bge for_2_end

	move.l #c2, a1
	move.w (a1, d3), d1

	move.l #b, a3

if_main:
	cmp.w #12, d1
	bge if_main_false
	move.l #m, a1
	add.l d3, a1
	move.l (a1), d4

	move.w #s1, a2
	cmp.l (a2, d1), d4
	bge if_1_false
	add.w #1, d2
if_1_false:
	move.w #s2, a2
	cmp.l (a2, d1), d4
	bge if_2_false
	add.w #1, d2
if_2_false:
	move.w #s3, a2
	cmp.l (a2, d1), d4
	bge if_2_false
	add.w #1, d2
if_3_false:
	move.w #s4, a2
	cmp.l (a2, d1), d4
	bge if_2_false
	add.w #1, d2
if_4_false:
	move.w #s5, a2
	cmp.l (a2, d1), d4
	bge if_2_false
	add.w #1, d2

	
	move.w d2, (a3, d3)
	add.w #1, d2
	bra for_2_start

if_main_false:
	move.w #-1, (a3, d3)
	add.w #1, d2
	bra for_2_start

for_2_end:
	clr.w d0

for_3_start:
	cmp.w #12, d0
	bge for_3_end
	move.w (a3, d3), o_char
	add.w #1, d0
	bra for_3_start

for_3_end:
	end