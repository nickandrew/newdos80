all: zout/sys2.cmd

zout/sys2.cmd: sys2.asm
	zmac --oo lst,cmd sys2.asm
