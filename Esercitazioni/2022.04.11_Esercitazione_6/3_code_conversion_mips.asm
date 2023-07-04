# s0, s1, s2, s3, s4 = n, a, b, c, d
# t0 = i
# t1 = t1

.text

#var in registers: s0, s2, s4

li $s1,1
move $t0,$zero

for_begin:
	bge $t0,$s0, for_end
	div $s3,$t0,2
	rem $s4,$s2,7
	beq $s4,1, for_continue

do_begin:
	sub $s4,$s4,$s1
	add $s3,$s3,$s2
	blt $s3,28, do_begin
	bgtz $s4, do_begin

div $s3,$s3,$s1
add $t1,$s3,5
bge $s2,$t1, for_end
sub $s2,$s2,1


for_continue:
	add $t0,$t0,1
	add $s1,$s1,$t0
	j for_begin


for_end:
	#output s1 e s2