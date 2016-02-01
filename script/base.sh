#! /bin/sh

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm \
  curl \
  git \
  tig \
  tmux \
  tree \
  unzip

git config --global user.name lisp719
git config --global user.email test@example.com
git config --global push.default simple
