#! /bin/sh

sudo dnf install -y \
  lxterminal \
  openbox \
  xorg-x11-xinit \
  xorg-x11-drv-evdev \
  xorg-x11-server-Xorg

# cp /etc/X11/xinit/xinitrc ~/.xinitrc

# sudo apt-get install -y \
#   fcitx-mozc \
#   ttf-mona

# sudo apt-get install -y \
#   lxde

# mkdir -p ~/.config/lxsession/LXDE
# cp ~/linux_files/autostart ~/.config/lxsession/LXDE/

# mkdir ~/.config/fcitx
# cp ~/linux_files/fcitx.profile ~/.config/fcitx/profile

# sudo sed -i.bak -e "/autologin=/a autologin=vagrant" /etc/lxdm/lxdm.conf
