#! /bin/sh

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm \
  curl \
  emacs \
  git \
  tig \
  tmux \
  tree \
  unzip
