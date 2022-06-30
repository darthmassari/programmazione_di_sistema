/*
	LPS Example

	Read Expression 1

	Language: C99
 	Style: plain C
*/

/*
	Read the code and predict what happens (computing values)
*/

int a, b = 5;
float x = 1.5, y;

int main( void ) {

	// arithmetic operators on int and float values
	a = x;		// a = 1
	a = 1.1f;	// a = 1
	a = 1.99f;	// a = 1

	a = b * x;	// a = 7
	y = b * x;	// y = 7.5
	
	int c = ( a - 1 ) + b, d;	// c = 11, d = 0
	d = 2;		// d = 2
	a = c / d;	// a = 5
	y = c / d;	// y = 5.5 NO y = 5.0

	float z = 11.0f;
	y = z / 2.0f; 	// y = 5.5
	y = z / 2;		// y = 5.5
	d = z / 2;		// d = 5
	d = z / 2 + 0.5f;	// d = 6

	a = c % d;	// a = 1 NO a = 5

	// compound assignments
	x = 10.8f;	
	x -= 2.1f;	// x = 8.7
	x /= 2;		// x = 4.35
	y *= x;		// y = 23.925
	y /= z;		// y = 2.175
	b = c;		// b = 11
	c %= d;		// c = 5

	return 0;
}