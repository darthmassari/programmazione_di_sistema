/*
* Si scriva un programma C89 in cui:
* 1.	Vengono dichiarati 2 array di char, str1 e str2, 
* 		di opportuna lunghezza, inizializzati, rispettivamente, con le stringhe "Real Programmers don¥'t " e "use Java"
* 2.	Viene dichiarato un array di char str3, di lunghezza pari alla somma delle lunghezze di str1 e str2
* 3.	Vengono effettuate opportune operazioni in modo che, al termine del programma, 
* 		str3 contenga la concatenazione della stringa contenuta in str1 e di quella contenuta in str2
*/

#include <stdio.h>
#include <malloc.h>

int main(void) {
	char str1 [25] = "Real Programmers don¥'t ";
	char str2 [8] = "use Java";
	char str3 [sizeof(str1) + sizeof(str2)];
	int i;
	for (i = 0; i < sizeof(str1); i++) {
		str3 [i] = str1 [i];
	}
	for (int j = 0; j < sizeof(str2); j++) {
		str3 [i + j + 1] = str2[j];
	}
	printf("%s\n", str3);
	return 0;
}

