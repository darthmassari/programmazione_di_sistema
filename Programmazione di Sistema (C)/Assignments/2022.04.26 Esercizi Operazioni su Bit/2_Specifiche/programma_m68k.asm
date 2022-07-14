* Scrivere un programma che soddisfa la specifica riportata sotto, nei seguenti linguaggi:
* c)assembly MC68000-ASM1 (simulare la lettura da input con copie dal registro A0 verso altri registri)

* Specifica
* ⁃	LEGGERE da input 4 interi senza segno x, a, b, c
* ⁃	SE x è minore di 256 e a, b e c sono ciascuno minore di 8 
*	ALLORA PORRE a 1 le cifre binarie di x che hanno posizioni uguali ai valori a, b, c
* ⁃	TERMINARE

org $4000
move.w a0, d0
move.w a0, d1
move.w a0, d2
move.w a0, d3

code_start:
	cmp.w #256, d0
	bgt if_false1
if_false1:
	cmp.w #8, d1
	bgt if_false2
if_false2:
	cmp.w #8, d2
	bgt if_false3
if_false3:
	cmp.w #8, d3
	bgt if_false

	move.b #$01, d5
	lsl d5, d1

	move.b #$01, d6
	lsl d6, d2
	or d6, d5

	move.b #$01, d6
	lsl d6, d3
	or d6, d5

	or d5, d0

if_false:

code_end: