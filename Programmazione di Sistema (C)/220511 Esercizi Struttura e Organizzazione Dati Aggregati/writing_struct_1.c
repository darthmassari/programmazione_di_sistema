
// Si scriva un programma C99 in cui

/*
* 1)Si dichiara un tipo struttura con tag `str_type1` e formata dai membri: 
* `size` di tipo `long`, `quantity` di tipo `unsigned short`, `price` di tipo `float`; 
* la stessa dichiarazione del tipo deve anche dichiarare una variabile 
* di nome `v1_type1`, inizializzata a piacere. 
* Dopo, si scriva una dichiarazione separata di una variabile di tale tipo struttura, 
* chiamata `v2_type1`, inizializzata a piacere
*/


struct str_type1 {
	long size;
	unsigned short quantity
	float price;	
} v1_type1 = {1, 5, 7.0};

struct str_type1 v2_type1 = {2, 7, 37.4f}


/*
* 2)Si dichiara un tipo struttura privo di tag, formato dal membro `object` di tipo `struct str_type1`
* e dal membro `name` di tipo array di 4 `char`, e attraverso il meccanismo del `typedef` si definisca 
* il nome `Str_type2` per tale tipo di struttura. 
* Dopo, siscriva una dichiarazione separata di:
* ⁃una variabile di tipo `Str_type2`, chiamata `v_type2`, inizializzata a piacere
* ⁃un array di lunghezza 2 con elementi di tipo `Str_type2`, chiamato `a_type2`
*/


typedef struct {
	struct str_type1 object;
	char name[4];
} str_type2;

str_type2 v_type2 = {{5, 7, 54.0f} {'S', 'E', 'E', 'S'}};
str_type2 a_type2 [2];


/*
* 3)Nella funzione `main`, si aggiunga ad ogni membro di `v1_type1`, il corrispondente membro di `v2_type1`
*/


int main(void) {
	v1_type1.size += v2_type1.size;
	v1_type1.quantity += v2_type1.quantity;
	v1_type1.price += v2_type1.quantity;
}


/*
* 4)Nella funzione `main`,
* ⁃si copi la variabile `v_type2` nell'elemento di posizione 0 di `a_type2`;
* ⁃poi si copi la variabile `v1_type1` nel membro `object` dell'elemento in posizione 1 di `a_type2`;
* ⁃poi si assegnino dei valori a piacere ai 4 elementi del membro `name` dell'elemento in posizione 1 di `a_type2` 
* (si osservi che il C non permette di modificare con un unico assegnamento il membro `name`, 
* perché esso è un array, quindi si devono assegnare uno alla volta i valori a ciascun elemento di tale array)
*/


int main (void) {
	a_type2[0] = v_type2;
	a_type2[1].object = v1_type1;
	// a_type2[1].name = {'S', 'A', 'A', 'S'}; NO
	a_type2[1].name[0] = 'S';
	//... SI
}