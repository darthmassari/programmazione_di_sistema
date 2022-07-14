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
* 	p_si = &b;
* 	*p_si += 1;
* 	a -= *p_si;
* 	p1_ss = &k;
* 	*p2_ss = *p1_ss;
* 	p1_ss = &h;
* 	*p1_ss = k - 3;
* 	p1_uc = &x, p2_uc = &y;
* 	*p2_uc += 4;
* 	*p1_uc = z + 1;
* 	p2_uc = p1_uc;
* 	*p1_uc -= y;
* 	*p2_uc += 5;
* }


	org $4000
* formato long per variabili int
a: dc.l 7
b: dc.l -5
* formato word per variabili short
g: dc.w 0
h: dc.w 0
k: dc.w 43
* formato byte per variabili unsigned char
x: dc.b 0
y: dc.b 31
z: dc.b 99
* formato long per variabili puntatori
p_si: dc.l 0
p1_ss: dc.l 0
p2_ss: dc.l g
p1_uc dc.l 0
p2_uc dc.l 0


	org $2000
code_start:
;	p_si = &b;
	move.l #b,p_si

;	*p_si += 1;
	move.l p_si,a0
	add.l #1,(a0)

;	a -= *p_si;
	sub.l (a0),a 	*NON POSSO FARE OPERAZIONI ARITMETICHE CON I REGISTRI INDIRIZZI
	move.l (a0),d0
	sub.l d0,a

;	p1_ss = &k;
	move.l #k,p1_ss

;	*p2_ss = *p1_ss;
	move.l p2_ss,a0
	move.l p1_ss,a1 	*OPPURE move.l p1_ss, p2_ss; VERIFICARE
	move.l (a1),(a0)

;	p1_ss = &h;
	move.l #h,p1_ss

;	*p1_ss = k - 3;
	move.w #k,d0
	sub.w #3,d0
	move.w d0,(a1)

;	p1_uc = &x, p2_uc = &y;
	move.l #x,p1_uc
	move.l #y,p2_uc

;	*p2_uc += 4;
	move.l p2_uc,a0
	add.l #4,(a0)

;	*p1_uc = z + 1;
	move.l p1_uc,a1
	move.b #z,d0
	add.b #1,d0
	move.b d0,(a1)

;	p2_uc = p1_uc;
	move.l p1_uc,p2_uc

;	*p1_uc -= y;
	move.b y,d0
	sub.b d0,(a1)

;	*p2_uc += 5;
	add.b #5,(a3)

end
	