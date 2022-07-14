#include <stdio.h>

int a, b, c, d, n;

int main (void) {
	scanf("%d", &n);
	scanf("%d%d", &b, &d);
	a = 1;
	i = 0;

	for_begin:
		if(i >= n) goto for_end;
		c = i / 2;
		d = b % 7;
		if (d == 1) goto for_continue;

		do_begin:
			d -= a;
			c += b;

			if (c < 38) goto do_begin;
			if (d > 0) goto do_begin;

		c /=a;
		int t1;
		t1 = c + 5;
		if (b >= t1) goto for_end;
		b--;

		for_continue:
			i += 1;
			a += i;
			goto for_begin

	for_end:
		printf("%d %d\n", a, b);
		return 0;
}