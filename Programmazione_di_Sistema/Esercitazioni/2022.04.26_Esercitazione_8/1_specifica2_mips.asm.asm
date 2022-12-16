# Specifica 2.MIPS
# 1. Caricare un valore immediato rappresentato
# 	 in esadecimale nel registro s0
# 2. Scrivere un'istruzione che modifica s0,
# 	 invertendo il contenuto dei bit di
#	 posizione 3, 8, 14

# maschera in binario: inserisco degli 1
# nelle posizioni di interesse, che in questo
# caso si trovano nei 16 bit meno significativi

# 0000 0000 0000 0000	0100 0001 0000 1000
# ___________________	 _		_	   _
# bit più significativi  14		8      3
# in esadecimale una quaterna di 0 è uno 0
# 0100 = 4 	0001 = 1 	1000 = 8
# risultato: 0x00004108

.text
li	$s0,0xAB34CD89
xor	$so,$s0,0x00004108