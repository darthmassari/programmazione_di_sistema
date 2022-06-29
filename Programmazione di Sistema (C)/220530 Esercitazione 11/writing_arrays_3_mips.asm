
.data 0x10010000

# dichiaro i vettori

A: .half 1,2,3,4,5,6,7,8
   .half 8,7,6,5,4,3,2,1

B: .byte 0,0,0,0,0,0,0,0
   .byte 0,0,0,0,0,0,0,0

.text
code_start:
	# metto i vettori in memoria
	la $s0,A
	la $s1,B
	move $t0,$zero	# i = 0

loop1_begin:
	bgeu $t0,16,loop1_end	# esco dal ciclo arrivato al 16esimo elemento

	sll $t4,$t0,1
	addu $t4,$t4,$s0
	lhu $t3,($t4)		# A[i]

	move $t5,$zero		# cont = 0
	move $t1,$zero		# j = 0

loop2_begin:
	bgeu $t1,16,loop2_end	# esco dal ciclo interno arrivato al 16esimo elemento

	sll $t4,$t1,1
	addu $t4,$t4,$s0
	lhu $t2,($t4)		# A[j]

	# potremmo usare un normale if, ma vediamo un altro modo
	slt $t4,$t2,$t3
	add $t5,$t5,$t4
	add $t1,$t1,1 		# cont += 1
	j loop2_begin


loop2_end:
	add $t2,$s1,$t0	#B[i]
	sb $t5,($t2)
	add $t0,$t0,1 		# incremento la i
	j loop1_begin

loop1_end:

code_end: