#! /bin/sh

sudo dnf install -y \
  lxterminal \
  gitk \
  git-gui \
  google-droid-sans-mono-fonts \
  ibus-kkc \
  ipa-gothic-fonts \
  i3 \
  xorg-x11-xinit \
  xorg-x11-drv-evdev \
  xorg-x11-server-utils \
  xorg-x11-server-Xorg

cp ~/linux_files/conf/.xinitrc ~

echo keycode 102=Super_L > ~/.Xmodmap
# xmodmap -pke > ~/.Xmodmap_default
# xmodmap ~/.Xmodmap
# xset -r 49
