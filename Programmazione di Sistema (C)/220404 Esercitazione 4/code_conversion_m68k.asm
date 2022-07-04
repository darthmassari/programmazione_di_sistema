* C
int s1 = 23, s2 = 9, s3 = -11;

int main(void) {
	s2 = s1 + s2 +4;
	s3 = s2 - (14 - s1);
	s1 = s2 - s3 - 15;

	return 0;
}


* MC68000-ASM1
org 2000$

* s1 = d1
* s2 = d2
* s2 = d3

start:
*	int s1 = 23, s2 = 9, s3 = -11;
	move.b #23,d1
	move.b #9,d2
	move.b #-11,d3

*	s2 = s1 + s2 +4;
	move.b d1,d0
	add.b d2,d0
	add.b #4,d0
	move.b d0,d2

*	s3 = s2 - (14 - s1);
	move.b #14,d0
	sub.b d1,d0
	move.b d2,d3
	sub.b d0,d3

*	s1 = s2 - s3 - 15;
	move.b d2,d1
	sub.b d3,d1
	sub.b #15,d1
END