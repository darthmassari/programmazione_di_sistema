1. move $s4,$t7	#valida

2. move $s1,120	#non valido, move copia i valori tra due registri

3. li $t0,120	#valida

4. exg $t3,$t5	#non esiste in mips ma in m68k

5. add $t6,$t1	#non valida, add vuole 3 operandi

6. add $t7,100,$t2	#valida, somma 100 e il contenuto di t2 e 						#lo memorizza in t7

7. sub $t6,$t1,$t2	#valida, guarda su

8. mult $t5,$t2,$a1	#non valida, mult vuole 2 operandi, altrimenti					  #mul vuole 3 operandi

9. div $t3,$t2,4 	#valida, il quoziente va nel primo operand, il					  #resto viene perduto

10. div $t6,$s2	#valida, quoziente e resto vengono memorizzati in				 #LO e in HI rispettivamente