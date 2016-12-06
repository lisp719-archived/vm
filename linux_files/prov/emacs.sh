#! /bin/sh

sudo dnf install -y \
  adobe-source-code-pro-fonts \
  emacs

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

emacs --daemon
