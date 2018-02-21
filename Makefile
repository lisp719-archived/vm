less:
	less Makefile
rebuild:
	vagrant.exe destroy -f
	vagrant.exe up
	vagrant.exe reload
