#! /bin/sh

sudo dnf install -y ncurses-compat-libs
npm i -g elm elm-oracle

cd /tmp
wget https://github.com/avh4/elm-format/releases/download/0.5.2-alpha/elm-format-0.18-0.5.2-alpha-linux-x64.tgz
tar zxvf elm-format-0.18-0.5.2-alpha-linux-x64.tgz
mv elm-format ~/bin
