# s1 = s1
# s2 = s2
# s3 = s3
# t1 = t1
# t1 = t1

.text

# int s1 = -325, s2, s3 = 826;
	li $s1,-325
	li $s2,0
	li $s3,826

# t1 = s1 + 22;
	add $t1,$s1,22

# t2 = s3 - 329;
	sub $t2,$s3,329

# s2 = 2048 - t1;
	li $t2,2048
	sub $s2,$t2,$t1

# s2 = s2 + t2;
	add $s2,$s2,$t2


# t1 = s1 - 345;
	sub $t1,$s1,-345

# t2 = s1 + 9;
	add $t2,$s1,9

# s3 = s2 - t2;
	sub $s3,$s2,$t2

# t1 = t1 - s3;
	sub $t1,$t1,$s3

# s1 = s1 - t1;
	sub $s1,$s1,$t1