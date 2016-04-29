#! /bin/sh

sudo apt-get install -y \
  fcitx-mozc \
  gvfs-bin \
  libnss3 \
  ttf-mona

sudo apt-get install -y \
  lxde \

wget https://github.com/atom/atom/releases/download/v1.7.2/atom-amd64.deb

sudo dpkg -i atom-amd64.deb

cd ~/linux_files/atom
./import.sh
cp ./config.cson ~/.atom/
cp ./keymap.cson ~/.atom/
