#! /bin/sh


sudo sed -i -e "1i Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/\$repo/os/\$arch" /etc/pacman.d/mirrorlist
sudo sed -i -e "2i Server = ftp://ftp.jaist.ac.jp/pub/Linux/ArchLinux/core/os/\$arch" /etc/pacman.d/mirrorlist

sudo pacman -Syyu --noconfirm
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
echo 'PATH=$HOME/bin:$PATH' >> ~/.bash_profile

curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/.tmux.conf -o ~/.tmux.conf
