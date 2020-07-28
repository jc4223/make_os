all:
	make imgtol.com

%.ias : %.ask
	./cpp0.exe -P -I. -o $*.ias $*.ask

%.3as : %.ias
	./aska.exe $*.ias $*.3as

%.nas : %.3as
	./naskcnv0.exe -l -s $*.3as $*.nas

%.com : %.nas
	./nask.exe $*.nas $*.org $*.lst
	./bim2bin.exe -osacmp -l2d3 in:$*.org out:$*.ld3
	#./bim2bin3 -osacmp -l2d3 in:$*.org out:$*.ld3
	./comcom.exe $*.ld3 $*.com
