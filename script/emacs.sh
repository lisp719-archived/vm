#! /bin/sh

sudo pacman -S --noconfirm emacs

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/.spacemacs -o ~/.spacemacs
echo 'export TERM=xterm-256color'

emacs --daemon
