/*
* Esercizio E (8 punti)
* Si scriva un programma C99 con le seguenti caratteristiche:
*   . definisce un tipo aggregato T formato da due membri di tipo char di nome c1 e c2, un
*     membro di tipo long di nome x e un membro di tipo int di nome y (l'ordine dei membri può
*     essere scelto come rivuole, per facilitare la traduzione in ASM)
*   . definisce un array a di lunghezza 10 di elementi di tipo T
*   . esegue un ciclo in cui chiede all'utente di inserire i dati da memorizzare in a
*   . ordina a in base ai valori crescenti dei membri c1 degli elementi (ovvero un elemento h viene
*     considerato minore di un elemento k se e solo se il membro c1 di h è minore del membro c1
*     di k)
*   . stampa, uno alla volta, gli elementi di a
* 
* Per ordinare a, il programma il seguente algoritmo (chiamato Insertion Sort)
*   . Per j che va da 2 a 10, ripeti:
*     - key assume a[ j ]
*     - i assume j - 1
*     - mentre i > 0 e a[ i ] > key, ripeti:
*       - a[ i + 1 ] assume a[ i ]
*       - i assume i - 1
*     - a[ i + 1 ] assume key
*/

#include <stdio.h>

struct T {
  char c1, c2;
  long x;
  int y;
};

struct T a[10];

int main(void){
  for(int i = 0; i < 10; i++){
    printf("Inserisci i dati per a[%d]:\n", i);
    scanf("%hhd %hhd", &a[i].c1, &a[i].c2);
    scanf("%ld", &a[i].x);
    scanf("%d", &a[i].y);
  }
  int i, key;
  for(int j = 2; 2<j<10; j++){
    key = a[ j ].c1;
    i = j - 1;
    while( i > 0 && a[ i ].c1 > key ){
      a[ i + 1 ] = a[ i ];
      i = i - 1;
    }
    a [ i + 1 ].c1 = key;
  }

  for(i = 0; i < 10; i++) {
    printf("%hhd %hhd %ld %d", a[i].c1, a[i].c2, a[i].x, a[i].y);
  }
  return 0;
}