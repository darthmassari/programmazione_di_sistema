1. move #100,$t0	;Istruzione non valida, i registri non
					;vogliono il $ e t0 non è un registro

2. move.l #$12345678,a1	;Istruzione valida, copia il numero in 							;formato esadecimale nel registro

3. move.b a3,d6 ;Istruzione valida, copia i primi 8 bit

4. swap d3,d5	;Istruzione non valida, swap ha un unico operando 				  ;serve per scambiare le duè metà del registro

5. add.w d2,a4	;Istruzione valida

6. add.l d2,d4,d6	;Istruzione non valida, add vuole solo due 						;operandi

7. muls a3,d2	;Istruzione non valida, muls non ammette registri 				  ;indirizzi al primo operando

8.muls #13,d6	;Istruzione valida, esegue l'operazione e la 					;memorizza in d6

9.divs #$1234,d7	;Istruzione valida, il quoziente viene							;memorizzato nei primi 16 bit e il resto nei 					 ;rimanenti bit

10.divs d4,a4	;Istruzione non valida, il secondo registro non 				;può essere indirizzi