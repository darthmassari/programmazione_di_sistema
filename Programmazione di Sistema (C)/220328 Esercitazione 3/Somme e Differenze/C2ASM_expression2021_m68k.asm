; d1 = s1
; d2 = s2
; d3 = s3
; d4 = t1
; d5 = t2
; d6 = temporaneo

org $2000

; int s1 = -325, s2, s3 = 826;
	move.w #-325,d1
	move.w #0,d2
	move.w #826,d3

; t1 = s1 + 22;
	move.w d1,d4
	add.w #22,d4

; t2 = s3 - 329;
	move.w d3,d5
	sub.w #329,d5

; s2 = 2048 - t1;
	sub.w #2048,d4
	move.w d4,d2

; s2 = s2 + t2;
	add.w d5,d2


; t1 = s1 - 345;
	move.w d1,d4
	sub.w #345,d4

; t2 = s1 + 9;
	move.w d1,d5
	add.w #9,d5

; s3 = s2 - t2;
	move.w d2,d3
	sub.w d5,d3

; t1 = t1 - s3;
	sub.w d3,d4

; s1 = s1 - t1;
	sub.w d1,d4

	end