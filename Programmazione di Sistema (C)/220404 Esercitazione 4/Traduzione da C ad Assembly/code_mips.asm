.text

# int s1 = 23, s2 = 9, s3 = -11;
	li $s1,23
	li $s2,9
	li $s3,-11
	
#	s2 = s1 + s2 +4;
	add $s1,$s1,$s2
	add $s2,$s1,4

#	s3 = s2 - (14 - s1);
	li $t1,14
	sub $t1,$t1,$s1
	sub $s3,$s2,$t1

#	s1 = s2 - s3 - 15;
	sub $s1,$s2,$s3
	sub $s1,$s1,15
