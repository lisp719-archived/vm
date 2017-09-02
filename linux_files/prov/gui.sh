#! /bin/sh

set -e

sudo dnf install -y \
  gitk \
  git-gui \
  google-droid-sans-mono-fonts \
  ibus-kkc \
  ipa-gothic-fonts \
  openbox \
  spacefm \
  tint2 \
  terminator \
  xorg-x11-xinit \
  xorg-x11-drv-evdev \
  xorg-x11-server-Xorg \
  urw-fonts

cp ~/linux_files/conf/.xinitrc ~

cp ~/linux_files/conf/mimeapps.list ~/.config/

mkdir -p ~/.config/terminator
cp ~/linux_files/conf/terminator ~/.config/terminator/config

mkdir -p ~/.config/tint2
cp ~/linux_files/conf/tint2rc ~/.config/tint2/tint2rc
