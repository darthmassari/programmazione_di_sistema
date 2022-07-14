/*
* Scrivi un programma C99. Il programma dichiara le variabili esterne indicate nell'elenco seguente.
* ⁃	variabili tipo int: a inizializzata a 7, b inizializzata a -5
* ⁃	variabili tipo puntatore a int: p_si
* ⁃	variabili tipo short: g, h, k inizializzata a 43
* ⁃	variabili tipo puntatore a short: p1_ss, p2_ss inizializzata con puntatore a g
* ⁃	variabili tipo unsigned char: x, y inizializzata a 31, z inizializzata a 99
* ⁃	variabili tipo puntatore a unsigned char: p1_uc, p2_uc

* ⁃	Il programma definisce una sola funzione: main, con tipo di risultato int e lista di parametri void.
* 	La funzione contiene istruzioni che effettuano la seguente sequenza di operazioni

* ⁃	p_si assume puntatore a b
* ⁃	incrementa di 1 la variabile puntata da p_si
* ⁃	a assume a diminuito della variabile puntata da p_si
* ⁃	p1_ss assume puntatore a k
* ⁃	la variabile puntata da p2_ss assume il valore della variabile puntata da p1_ss
* ⁃	p1_ss assume puntatore a h
* ⁃	la variabile puntata da p1_ss assume k diminuito di 3
* ⁃	p1_uc assume puntatore a x, p2_uc assume puntatore a y
* ⁃	la variabile puntata da p2_uc viene aumentata di 4
* ⁃	la variabile puntata da p1_uc assume z aumentato di 1
* ⁃	p2_uc assume il puntatore contenuto in p1_uc
* ⁃	la variabile puntata da p1_uc viene diminuita di y
* ⁃	la variabile puntata da p2_uc viene aumentata di 5
*/


int a = 7, b = -5;
int *p_si;
short g, h, k = 43;
short *p1_ss, *p2_ss = &g;
unsigned char x, y = 31, z = 99;
unsigned char *p1_uc, *p2_uc;

int main (void) {
	p_si = &b;
	*p_si += 1;		// O (*p_si) += 1; 	VERIFICARE
	a -= *p_si;
	p1_ss = &k;
	*p2_ss = *p1_ss;
	p1_ss = &h;
	*p1_ss = k - 3;
	p1_uc = &x, p2_uc = &y;
	*p2_uc += 4;
	*p1_uc = z + 1;
	p2_uc = p1_uc;
	*p1_uc -= y;
	*p2_uc += 5;

	return 0;
}