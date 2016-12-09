#! /bin/sh

sudo dnf install -y \
  gitk \
  git-gui \
  google-droid-sans-mono-fonts \
  ibus-kkc \
  ipa-gothic-fonts \
  lxterminal \
  openbox \
  spacefm \
  tint2 \
  xorg-x11-xinit \
  xorg-x11-drv-evdev \
  xorg-x11-server-Xorg \

cp ~/linux_files/conf/.xinitrc ~
