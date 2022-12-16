# Trasforma il programma C che hai scritto come soluzione dell'esercizio 
# Writing: Pointer 1 C, in un programma equivalente 
# (ovvero che esegue le stesse operazioni e produce gli stessi risultati) in ASM MIPS32-MARS. 

# Usa
# ⁃	parole di registro in formato long per memorizzare le variabili puntatore;
# ⁃	parole di registro in formato long per memorizzare le variabili di tipo int;
# ⁃	parole di registro in formato word per memorizzare le variabili di tipo short;
# ⁃	parole di registro in formato byte per memorizzare le variabili di tipo unsigned #har;


# int a = 7, b = -5;
# int *p_si;
# short g, h, k = 43;
# short *p1_ss, *p2_ss = &g;
# unsigned char x, y = 31, z = 99;
# unsigned char *p1_uc, *p2_uc;

# int main (void) {
# 	p_si = &b;			
# 	*p_si += 1;			
# 	a -= *p_si;
# 	p1_ss = &k;		
# 	*p2_ss = *p1_ss;
# 	p1_ss = &h;		
# 	*p1_ss = k - 3;
# 	p1_uc = &x, p2_uc = &y;	
# 	*p2_uc += 4;
# 	*p1_uc = z + 1;
# 	p2_uc = p1_uc;
# 	*p1_uc -= y;
# 	*p2_uc += 5;
# }

.data 10010000

# formato word per variabili int
a:	.word 7
b:	.word -5
# formato half per variabili short
g:	.half 0
h:	.half 0
k:	.half 43
# formato byte per variabili unsigned char
x:	.byte 0
y:	.byte 31
z:	.byte 99
# formato word per variabili puntatori
p_si:	.word 0
p1_ss:	.word 0
p2_ss:	.word g
p1_uc:	.word 0
p2_uc:	.word 0

.text
code_start:
#	p_si = &b;
	la $t0, b
	sw $t0, p_si

#	*p_si += 1;
	la $s0,p_si
	lw $t0,($s0)
	add $t0,$t0,1
	sw $t0,($s0)

#	a -= *p_si;
	lw $s1,a
	sub $s1,$s1,$t0	
	sw $s1,a

#	p1_ss = &k;
	la $t0,b
	sw $t0,p1_ss

#	*p2_ss = *p1_ss;
	la $s1,p1_ss		#s1 contiene l'indirizzo di p1_ss
	lh $t1,($s1)		#t1 contiene la variabile puntata da p1_ss
	la $s2,p2_ss		#s2 contiene l'indirizzo di p2_ss
	sh $t1,($s2)		#copio la variabile puntata da p1_ss nel puntatore p2_ss

#	p1_ss = &h;
	la $t0,h
	sw $t0,p1_ss

#	*p1_ss = k - 3;
	lh $t0,k
	sub $t0,$t0,3
	sh $t0,p1_ss

#	p1_uc = &x, p2_uc = &y;
	la $t0,x
	sw $t0,p1_uc
	la $t0,y
	sw $t0,p2_uc

#	*p2_uc += 4;
	la $s0,p2_uc
	lbu $t0,($s0)
	addu $t0,$t0,4
	sb $t0,($s0)

#	*p1_uc = z + 1;
	lbu $t0,z
	addu $t0,$t0,1
	sb $t0,p1_uc

#	p2_uc = p1_uc;
	la $s0,p1_uc
	sw $s0,p2_uc

#	*p1_uc -= y;
	lbu $t0,y
	lbu $t1,($s0)
	subu $t1,$t1,$t0
	sb $t1,($s0)

#	*p2_uc += 5;
	la $s0,p2_uc
	lbu $t0,($s0)
	addu $t0,$t0,5
	sb $t0,($s0)