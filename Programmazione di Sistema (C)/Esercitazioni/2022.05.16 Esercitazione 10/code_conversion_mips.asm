.data 0x10010000

# unsigned char array1[8] = {9, 3, 0, 5, 1, 12, 19, 7};
array1: .byte 9,3,0,5,1,12,19,7
# ...
array2: .word -5,27,39,-9,-58,3,67,-2,4,9
id1: .word 6	# a scelta
id2: .word 3	# a scelta

.text

inzio_codice:

	lbu $t0,array1+3	# prendo l'elemento di posizione 3
	add $t0,$t0,8
	sb $t0,array1+3

	la $t1,array1	# t1 contiene l'indirizzo di array1
	lw $t2,id1
	add $t1,$t1,$t2	# t1 contiene l'indirizzo di array1[id1]
	
	lbu $t0,($t1)	# t0 prende il contenuto dell'indirizzo array1[id1]
	mul $t0,$t0,3
	sb $t0,array1+5	# inserisco il contenuto di t0 in array1[5]