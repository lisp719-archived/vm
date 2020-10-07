#! /bin/sh

set -e

# network
echo nameserver 8.8.8.8 | sudo tee /etc/resolv.conf
echo PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" | sudo tee /etc/environment
sudo sed -i.bak -e 's%http://\S\+%mirror://mirrors.ubuntu.com/mirrors.txt%g' /etc/apt/sources.list

# package
sudo apt update
sudo apt install -y \
  atool \
  bash-completion \
  byobu \
  fd-find \
  fzf \
  git \
  htop \
  nano \
  ranger \
  tig \
  unzip \
  wget \
  vim

# docker
sudo addgroup --system docker
sudo adduser $USER docker
sudo snap install docker

# after package
byobu || :
byobu-enable
byobu-disable-prompt
curl 'http://vim-bootstrap.com/generate.vim' -d 'editor=vim' > ~/.vimrc

# etc
cp -r /media/sf_sync/dotfiles/.[!.]* ~
mkdir -p ~/bin ~/code ~/sandbox
sudo timedatectl set-timezone Asia/Tokyo

echo success
