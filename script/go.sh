#! /bin/sh

sudo pacman -S --noconfirm go

mkdir ~/go
echo 'export GOPATH=~/go' >> ~/.bash_profile
echo 'export PATH=$PATH:~/go/bin' >> ~/.bash_profile

source ~/.bash_profile
