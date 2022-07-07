* Il programma seguente è composto da 2 sezioni. La sezione dati è completa, mentre
* nella sezione codice sono presenti solo i commenti che indicano le operazioni
* che il programma deve svolgere. Completare il programma scrivendo le istruzioni
* mancanti.


* Sezione Dati
	org	$4000

inizio_dati:	
	dc.l	8,48,64,128
	dc.w	1088,16
	dc.b	5,10
lab1:
	dc.b	9,6,12,18
	dc.w	4096
	dc.l	128000,480000

* Sezione Codice
	org	$2000
	
* Referenziare nel registro a0, le parole di indirizzo $4010
	move.l 	$4000+10,d0
	move.l 	d0,(a0)

* Indirezione: 
; 1) copiare il byte referenziato da a0 in d0
	move.b 	(a0),d0

; 2) copiare la word referenziata da a0 in d1
	move.w 	(a0),d1

; 3) copiare la long referenziata da a0 in d2
	move.l 	(a0),d2

* Referenziare nel registro a1, le parole il cui indirizzo è legato alla label "lab1"
	move.l 	#lab1,(a1)

* Indirezione: 
; 1) copiare il byte referenziato da a1 in d0
	move.b 	(a1),d0

; 2) copiare la word referenziata da a1 in d1
	move.w 	(a1),d1

; 3) copiare la long referenziata da a1 in d2
	move.l 	(a1),d2

* Referenziare nel registro a2, le parole il cui indirizzo ha distanza +2 
* rispetto all'indirizzo legato alla label "lab1"
	move.l 	#lab1,2(a2)

* Indirezione: 
; 1) copiare il byte referenziato da a2 in d0
	move.b 	(a2),d0
; 2) copiare la word referenziata da a2 in d1
	move.w 	(a2),d1

; 3) copiare la long referenziata da a2 in d2
	move.l 	(a2),d2

	end

