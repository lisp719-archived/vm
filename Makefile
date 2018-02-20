none:

build:
	vagrant.exe destroy -f
	vagrant.exe up
	vagrant.exe reload
reload:
	vagrant.exe reload
