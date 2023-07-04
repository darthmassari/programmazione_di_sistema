* 5. Si legga il seguente programma. Si assuma che prima di eseguire il programma tutti i registri contengano il valore 0. 
* Ciascuna istruzione modifica uno o più registri. Si simuli l'esecuzione del programma. 
* Per ciascuna istruzione, si scrivano i registri modificati e i valori in essi contenuti. 
* Si raccomanda di indicare i valori formati da tutti e 32 i bit che formano i registri, 
* anche se l'istruzione ne ha modificato solo una parte. 
* Si consiglia di rappresentare i valori contenuti nei registri in codifica esadecimale 
* (ricordando che in MC68000-ASM1 si indica che un valore numerico è rappresentato in codifica esadecimale, 
* usando il carattere $ come prefisso della codifica).

org$2000
move.l #$12345678, d0 	; d0 assume 0x12345678
move.w #$1234, d1 	; d1 assume 0x00001234
move.l d0, d2 	; d2 assume 0x12345678
add.b #$22, d2 	; d2 assume 0x1234569a
move.l #$DEADC0DE, d3	; d3 assume deadc0de (?)
move.w d1, d2	; d2 assume 0x12345678
swap d1 	; d1 assume 0x12340000
move.w d3,d1 	; d1 assume 0x1234c0de
exg d3,d0 	; d3 assume 0x12345678, d0 assume 0xdeadc0de
move.b #$65,d3 	; d3 assume 0x12345665
end