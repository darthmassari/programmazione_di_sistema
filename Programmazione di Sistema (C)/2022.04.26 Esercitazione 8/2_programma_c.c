/*
2 Scrivere un programma che soddisfa la specifica 
riportata sotto
a) C99 
realizzare la lettura da input mediante la funzione scanf

Specifica
⁃LEGGERE da input 4 interi senza segno x, a, b, c
⁃SE x è minore di 256 e a, b e c sono ciascuno minore di 8 
 ALLORA PORRE a 1 le cifre binarie di x che hanno 
 posizioni uguali ai valori a, b, c
⁃TERMINARE
*/

unsigned x, a, b, c;
scanf("%u %u %u %u", &x, &a, &b, &c);

//a, b, c sono tutti minori di 8, quindi posso
//lavorare con soli 8 bit, ossia 2 cifre esadecimali

//
if (x < 256 && a < 8 && b<8 && c < 8) {
	unsigned mask;
	mask = 0x01 << a;	//maschera per posizione a

	mask = mask | (0x01 << a);	//maschera per posizione b
	
	mask = mask | (0x01 << c);	//maschera per posizione c
	
	x = x | mask;	//modifico x
}
