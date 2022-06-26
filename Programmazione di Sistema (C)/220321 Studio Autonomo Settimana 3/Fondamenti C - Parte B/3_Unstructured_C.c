#include <stdio.h>

int a = 21, b = -3, c, d;

int main (void) {
	scanf("%d", &d);
	c = a;
	d -= 1;

	int t1, t2;
	t1 = 3 * d;
	t1 += 4;
	t2 = b - t1;
	c += t2;

	int t3;
	t3 = c + d;
	t3 /= 2;
	printf("%d", t3);

	int t4;
	t4 = d + a;
	a = b * t4;
	b += 1;

	c -= 1;
	a /= d;
	t4 = c * a;
	b -= t5;

	a -= 1;
	d = c - a;
	c -= 1;

	printf("%d %d %d %d\n", a, b, c, d);

	return 0;

}