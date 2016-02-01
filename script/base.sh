#! /bin/sh

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm \
  curl \
  git \
  nodejs \
  tig \
  tmux \
  tree \
  unzip

git config --global user.name lisp719
git config --global user.email test@example.com
git config --global push.default simple

mkdir ~/bin

echo >> ~/.bash_profile
curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/add_bash_profile >> ~/.bash_profile
curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/.tmux.conf -o ~/.tmux.conf
