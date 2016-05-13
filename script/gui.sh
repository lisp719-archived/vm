#! /bin/sh

sudo apt-get install -y \
  emacs-mozc \
  fcitx-mozc \
  ttf-mona

sudo apt-get install -y \
  lxde \

mkdir -p ~/.config/fcitx
cp ~/linux_files/fcitx.profile ~/.config/fcitx/profile

wget https://download.sublimetext.com/sublime-text_build-3114_amd64.deb
sudo dpkg -i sublime-text_build-3114_amd64.deb
rm sublime-text_build-3114_amd64.deb

wget https://packagecontrol.io/Package%20Control.sublime-package -P ~/.config/sublime-text-3/Installed\ Packages/

mkdir -p ~/.config/sublime-text-3/Packages/User/
cp ~/linux_files/subl/* ~/.config/sublime-text-3/Packages/User/

git config  --global  core.editor "subl -w"
