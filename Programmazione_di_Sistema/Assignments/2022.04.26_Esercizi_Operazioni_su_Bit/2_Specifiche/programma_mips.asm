# Scrivere un programma che soddisfa la specifica riportata sotto, nei seguenti linguaggi:
# b) assembly MIPS32-MARS (realizzare la lettura da input mediante ASM-API di MARS)

# Specifica
# ⁃	LEGGERE da input 4 interi senza segno x, a, b, c
# ⁃	SE x è minore di 256 e a, b e c sono ciascuno minore di 8 
#	ALLORA PORRE a 1 le cifre binarie di x che hanno posizioni uguali ai valori a, b, c
# ⁃	TERMINARE

.text
li $s0, 204
li $s1, 5
li $s2, 7
li $s3, 4

code_start:
	bgt $s0, 256, if_false1
if_false1:
	bgt $s1, 8, if_false2
if_false2:
	bgt $s2, 8, if_false3
if_false3:
	bgt $s3, 8, if_false

	li $t0, 0x01
	sll $t7, $t0, 5

	sll $t1, $t0, 7
	or $t7, $t7, $t1

	sll $t1, $t0, 4
	or $t7, $t7, $t1

	or $s0, $s0, $t7 

if_false:

code_end: