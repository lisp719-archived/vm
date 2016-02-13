#! /bin/sh

sudo pacman -S --noconfirm go

mkdir ~/go
echo 'export GOPATH=~/go' >> ~/.bash_profile
echo 'export PATH=$PATH:~/go/bin' >> ~/.bash_profile

source ~/.bash_profile

go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/oracle
go get -u -v golang.org/x/tools/cmd/gorename

go get github.com/peco/peco/cmd/peco

echo 'cdp() { cd `find $1 -type d | peco`; }' >> ~/.bash_profile
