/*
* Scrivere un programma che soddisfa la specifica riportata sotto, nei seguenti linguaggi:
* a) C99 (realizzare la lettura da input mediante la funzione scanf)
* 
* Specifica
* ⁃	LEGGERE da input 4 interi senza segno x, a, b, c
* ⁃	SE x è minore di 256 e a, b e c sono ciascuno minore di 8 
* 	ALLORA PORRE a 1 le cifre binarie di x che hanno posizioni uguali ai valori a, b, c
* ⁃	TERMINARE
*/

unsigned x, a, b, c;
int main(void) {
	scanf("%u %u %u %u", &x, &a, &b, &c);
	if(x < 256 && a < 8 && b < 8 && c < 8) {
		unsigned mask;
		mask = 0x01 << a;
		mask = mask | (0x01 << b);
		mask = mask | (0x01 << c);
		x = x | mask;
	}
	return 0;
}