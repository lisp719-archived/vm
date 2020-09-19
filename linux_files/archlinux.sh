#! /bin/sh

set -e

# mount
mkdir -p ~/tmp_linux_files ~/tmp_sync
sudo mount -t vboxsf linux_files ~/tmp_linux_files
sudo mount -t vboxsf sync ~/tmp_sync

# common
cp -r ~/tmp_linux_files/dotfiles/.[!.]* ~
cp ~/tmp_sync/.ssh/* ~/.ssh/ && chmod 600 ~/.ssh/*
mkdir -p ~/bin ~/code
sudo timedatectl set-timezone Asia/Tokyo
sudo rm /etc/resolv.conf && echo nameserver 8.8.8.8 | sudo tee /etc/resolv.conf

# package
sudo cp ~/tmp_linux_files/mirrorlist /etc/pacman.d/mirrorlist
sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed \
  atool \
  base-devel \
  bash-completion \
  docker \
  docker-compose \
  fd \
  fzf \
  git \
  htop \
  prettier \
  ranger \
  tig \
  tree \
  unzip \
  tilda \
  w3m \
  wget \
  vim

# other package
type yay || bash -c "cd /tmp; git clone https://aur.archlinux.org/yay-bin.git; cd yay-bin; makepkg -si --noconfirm"
yay -S --needed --noconfirm \
  byobu

# after package
curl 'http://vim-bootstrap.com/generate.vim' -d 'editor=vim' > ~/.vimrc
sudo cp -r  ~/tmp_linux_files/system/* /etc/systemd/system/
sudo systemctl enable docker
sudo usermod -aG docker vagrant
sudo usermod -aG vboxsf vagrant

# umount
sudo umount ~/tmp_linux_files/
sudo umount ~/tmp_sync/
rmdir ~/tmp_linux_files ~/tmp_sync

echo success
