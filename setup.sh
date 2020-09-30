#! /bin/sh

set -e

# cp
sudo cp -r /media/sf_sync/settings /tmp/
sudo chown -R $USER:$USER /tmp/settings
find /tmp/settings/ -type f | xargs chmod 644
sudo cp -r /tmp/settings/etc/* /etc/
cp -r /tmp/settings/dotfiles/.[!.]* ~
rm -rf /tmp/settings

# etc
mkdir -p ~/bin ~/code ~/sandbox
sudo timedatectl set-timezone Asia/Tokyo
sudo groupadd docker || :
sudo usermod -aG docker $USER
sudo usermod -aG vboxsf $USER

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
sudo snap install docker

# after package
byobu-enable
curl 'http://vim-bootstrap.com/generate.vim' -d 'editor=vim' > ~/.vimrc

echo success
