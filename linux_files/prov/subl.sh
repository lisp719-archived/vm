#! /bin/sh

sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

sudo dnf install -y \
  pygobject3 \
  sublime-text

wget https://packagecontrol.io/Package%20Control.sublime-package -P ~/.config/sublime-text-3/Installed\ Packages/
cp -r ~/linux_files/conf/subl ~/.config/sublime-text-3/Packages

git config --global core.editor "subl -w"
