#! /bin/sh

set -e

# cp
sudo cp -r /media/sf_sync /tmp/
sudo chown -R $USER:$USER /tmp/sf_sync
find /tmp/sf_sync/ -type f | xargs chmod 644
chmod 600 /tmp/sf_sync/dotfiles/.ssh/*
sudo cp -r /tmp/sf_sync/etc/* /etc/
cp -r /tmp/sf_sync/dotfiles/.[!.]* ~

# package
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
  nano \
  prettier \
  ranger \
  tig \
  tree \
  unzip \
  w3m \
  wget \
  vim

# other package
type yay || bash -c "cd /tmp; git clone https://aur.archlinux.org/yay-bin.git; cd yay-bin; makepkg -si --noconfirm"
yay -S --needed --noconfirm \
  byobu

# after package
sudo systemctl enable docker
sudo usermod -aG docker vagrant
sudo usermod -aG vboxsf vagrant
byobu-enable
curl 'http://vim-bootstrap.com/generate.vim' -d 'editor=vim' > ~/.vimrc

# etc
sudo timedatectl set-timezone Asia/Tokyo
mkdir -p ~/bin ~/code

echo success
