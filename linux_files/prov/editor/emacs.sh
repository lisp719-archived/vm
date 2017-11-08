#! /bin/sh

sudo dnf install -y \
  adobe-source-code-pro-fonts \
  emacs

git clone --depth 1 https://github.com/syl20bnr/spacemacs ~/.emacs.d
cp ~/linux_files/conf/.spacemacs ~/.spacemacs

emacs --daemon
