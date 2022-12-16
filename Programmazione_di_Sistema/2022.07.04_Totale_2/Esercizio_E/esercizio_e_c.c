/*
* Esercizio E (8 punti)
* Si scriva, in C99, MIPS32-MARS e MC68000, un programma con le seguenti caratteristiche:
*   . definisce un tipo aggregato T formato dai seguenti membri (disposti nell'ordine che si
*     preferisce, per facilitare la traduzione in ASM):
*     - 5 membri di un tipo in grado di memorizzare interi nell'intervallo [-32768, 32767], di
*       nome s1, s2, s3, s4, s5
*     - 2 membri di un tipo in grado di memorizzare interi nell'intervallo [-128, 127], di nome
*       c1, c2
*     - 1 membro di un tipo in grado di memorizzare interi nell'intervallo [-2^31, 2^31-1], di
*       nome m
*   . definisce un array a di lunghezza 12 di elementi di tipo T (indici numerati a partire da 0)
*   . definisce un array b di lunghezza 12 di elementi di un tipo in grado di memorizzare interi
*     nell'intervallo [-128, 127] (gli indici sono numerati a partire da 0)
*   . esegue un ciclo in cui chiede all'utente di inserire i dati da memorizzare in a
*   . per ciascun indice j valido per a, ripete
*     - h assume il valore del membro c2 di a[ j ]
*     - se h è un indice valido per a, allora
*       - conta quanti dei membri s1, s2, s3, s4, s5 di a[ h ] sono maggiori del membro
*         m di a[ j ]
*       - b[ j ] assume il risultato del conteggio fatto al passo precedente
*     - altrimenti b[ j ] assume -1
*   . stampa, uno alla volta, gli elementi di b
 
* Per la versione C99, usare
*   - il tipo signed char per rappresentare interi nell'intervallo [-128, 127]
*   - il tipo short per memorizzare interi nell'intervallo [-32768, 32767]
*   - il tipo long per memorizzare interi nell'intervallo [-2^31, 2^31-1]
*/

#include <stdio.h>

struct T {
  char c1, c2;
  int s1, s2, s3, s4, s5;
  long m;
};

struct T a[12];
char b[12];

int main(void) {
  for(int i = 0; i < 12; i++) {
    printf("Inserisci i dati per a[%d]: \n", i);
    scanf("%c %c", &a[i].c1, &a[i].c2);
    scanf("%d %d %d %d %d", &a[i].s1, &a[i].s2, &a[i].s3, &a[i].s4, &a[i].s5);
    scanf("%ld", &a[i].m);
  }

  int h, k;
  for(int j = 0; j < 12; j++) {
    h = a[j].c2;
    if(h < 12) {
      if(a[h].s1 > a[j].m)
        k++;
      if(a[h].s2 > a[j].m)
        k++;
      if(a[h].s3 > a[j].m)
        k++;
      if(a[h].s4 > a[j].m)
        k++;
      if(a[h].s5 > a[j].m)
        k++;
      b[j] = k;
    } else {
      b[j] = -1;
    }
  }

  for(i = 0; i < 12; i++)
    printf("Elemento b[%d] = %c", i, b[i]);
  return 0;
}