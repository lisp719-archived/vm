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

mkdir -p ~/.config
cp -R ~/linux_files/conf/terminator ~/.config
