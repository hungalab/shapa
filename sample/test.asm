	DELAY 8
	LDI r3,#4
	LDI r0,#0
	LDI r1,#8
	LDI r4,#4
	LDI r2,#0x20
lp:	LD_ADD r0,r1,#0
	ST_ADDS r2,r4,#0
	ADDI r3,#-1
	LD_ADD r0,r1,#0
	ST_ADDS r2,r4,#1
	BNZD r3,lp
	DONE
