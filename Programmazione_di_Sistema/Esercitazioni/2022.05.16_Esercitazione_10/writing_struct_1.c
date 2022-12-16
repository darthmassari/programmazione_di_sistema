#include <stdio.h>

// Writing Struct 1
struct str_type1 {
	long size;
	unsigned short quantity;
	float price;
} v1_type1 = {111};	// Inizializzazione parziale

struct str_type1 v2_type1 = {22, 2, 2.4f};

// Writing Struct 2
typedef struct {
	struct str_type1 object;
	char name[4];
} str_type2;

str_type2 v_type2 = {{120000, 5, 99.99}, {'O', 'B', 'J', '1'}};

str_type2 a_type2[2];

//oppure posso scrivere tutto in un'unica riga
str_type2 v_type2 = {{120000, 5, 99.99}, {'O', 'B', 'J', '1'}}, str_type2 a_type2[2];

//Writing Struct 3
int main (void) {
	v1_type1.size += v2_type1.size;
	v1_type1.quantity += v2_type1.quantity
	v1_type1.price += v2_type1.price;
}

//Writing Struct 4
int main (void) {
	v1_type1.size += v2_type1.size;
	v1_type1.quantity += v2_type1.quantity
	v1_type1.price += v2_type1.price;

	a_type2[0] = v_type2;
	a_type2.object = v1_type1;
	for (int i = 0; i < 4; i++)
		a_type2[1].name[i] = 'A'
	return 0;
}