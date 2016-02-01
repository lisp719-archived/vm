#! /bin/sh

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm \
  curl \
  git \
  tig \
  tmux \
  tree \
  unzip
