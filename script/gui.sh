#! /bin/sh

sudo apt-get install -y \
  gvfs-bin \
  ibus-mozc \
  libnss3 \
  lxde \
  ttf-mona

wget https://github.com/atom/atom/releases/download/v1.7.2/atom-amd64.deb

sudo dpkg -i atom-amd64.deb

cd ~/linux_files/atom
./import.sh
cp ./config.cson ~/.atom/
cp ./keymap.cson ~/.atom/
