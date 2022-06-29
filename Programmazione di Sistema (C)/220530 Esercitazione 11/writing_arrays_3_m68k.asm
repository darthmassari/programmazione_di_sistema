org $4000

* dichiaro i vettori
A: dc.w 1,2,3,4,5,6,7,8,8,7,6,5,4,3,2,1
B: dcb.b 16,0	
* dcb permette di inizializzare un blocco di dati:
* prende 16 valori e li pone a 0

org $2000

code_start:
	* metto i vettori in memoria
	move.l #A,a0
	move.l #B,a1
	move.w #0,d0	; i = 0

loop1_begin:
	cmp #32,d0
	bhs loop1_end	; "branch on higher than or same" equivalente a bcc (generico), 
					; serve solo al programmatore perchè più intuitiva(?)
					; esco dal ciclo esterno arrivato al 16esimo elemento

	move.w (a0,d0.w),d3		; A[i]
	move.w #0,d1	; j = 0
	move.w #0,d2	; cont = 0

loop2_begin:
	cmp.w #32,d1
	bhs loop2_end	; esco dal ciclo interno arrivato al 16esimo elemento

	move.w (a0,d1.w),d4		;A[j]

	cmp.w d3,d4
	bhs loop2_no_count	; se A[j] <= A[i], vado a loop2_no_count 
	add.b #1,d2			; altrimenti cont += 1

loop2_no_count:
	add.w #2,d1		; incremento la j
	bra loop2_begin	; ripeto ciclo interno

loop2_end:
	move.b d2,(a1)+
	add.w #2,d0		; incremento la i
	bra loop1_begin	; ripeto ciclo esterno

loop1_end:

code_end: