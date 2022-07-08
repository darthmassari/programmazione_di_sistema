* Trasforma il programma C che hai scritto come soluzione dell'esercizio 
* Writing: Pointer 1 C, in un programma equivalente 
* (ovvero che esegue le stesse operazioni e produce gli stessi risultati) in ASM MC68000-ASM1. 

* Usa
* ⁃	parole di registro in formato long per memorizzare le variabili puntatore;
* ⁃	parole di registro in formato long per memorizzare le variabili di tipo int;
* ⁃	parole di registro in formato word per memorizzare le variabili di tipo short;
* ⁃	parole di registro in formato byte per memorizzare le variabili di tipo unsigned char;


* int a = 7, b = -5;
* int *p_si;
* short g, h, k = 43;
* short *p1_ss, *p2_ss = &g;
* unsigned char x, y = 31, z = 99;
* unsigned char *p1_uc, *p2_uc;

* int main (void) {
* 	*p_si = &b;
* 	*p_si += 1;
* 	a -= *p_si;
* 	*p1_ss = &k;
* 	*p2_ss = *p1_ss;
* 	*p1_ss = &h;
* 	*p1_ss = k - 3;
* 	*p1_uc = &x, *p2_uc = &y;
* 	*p2_uc += 4;
* 	*p1_uc = z + 1;
* 	p2_uc = p1_uc;
* 	*p1_uc -= y;
* 	*p2_uc += 5;
* }

*long per i puntatori
p_si equ $00002800
p1_ss equ $00002804
p2_ss equ $00002808
p1_uc equ $0000280c
p2_uc equ $00002810

*long per variabili int
a equ $00002814
b equ $00002818

*word per variabili short
g equ $0000281c
h equ $0000281e
k equ $00002820

*byte per variabili unsigned char
x equ $00002822
y equ $00002823
z equ $00002824

org $2000
code_start:
	move.l #7,a
	move.l #-5,b
	move.w #43,k
	
	move.w g,p2_ss

	move.b #31,y
	move.b #99,z

	