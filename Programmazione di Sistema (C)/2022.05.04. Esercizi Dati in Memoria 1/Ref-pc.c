/*
	LPS Example

	Data in Memory

	Language: C99
 	Style: plain C
 	Version: Ref-pc
 */

/*
	Problem statement: transform the C program in an equivalent program
		in MIPS32-MARS and MC68000-ASM1, representing data in memory
 */

/*
	Original Plain C Code
*/

signed char a, b = 'A', c = -43;
unsigned short x = 450, y, z = 98;
long v, w = 220200;
signed short h, k = 600, m = 12;

int main( void ) {

	a = b + c;
	y = x * z + 2300;
	h = k * a + m;
	v = w - 160900 - h;
	h = 780;
	k = -24078 % m + 4 * h;

	return 0;
}
