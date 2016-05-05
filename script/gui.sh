#! /bin/sh

sudo apt-get install -y \
  emacs-mozc \
  fcitx-mozc \
  lxde \
  ttf-mona

mkdir -p ~/.config/fcitx
cp ~/linux_files/fcitx.profile ~/.config/fcitx/profile

wget https://download.sublimetext.com/sublime-text_build-3103_amd64.deb
sudo dpkg -i sublime-text_build-3103_amd64.deb
