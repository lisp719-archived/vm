#! /bin/sh

set -e

sudo dnf install -y \
  fcitx-kkc \
  fcitx-configtool \
  gdouros-symbola-fonts.noarch \
  gitk \
  git-gui \
  google-droid-sans-mono-fonts \
  ipa-gothic-fonts \
  meld \
  openbox \
  spacefm \
  tint2 \
  terminator \
  xorg-x11-xinit \
  xorg-x11-drv-evdev \
  xorg-x11-server-Xorg \
  urw-fonts

git config --global gui.gcwarning false

cp ~/linux_files/conf/.xinitrc ~

mkdir -p ~/.config
cp ~/linux_files/conf/mimeapps.list ~/.config/

mkdir -p ~/.config/terminator
cp ~/linux_files/conf/terminator ~/.config/terminator/config

mkdir -p ~/.config/fcitx
cp ~/linux_files/conf/fcitx/* ~/.config/fcitx/
