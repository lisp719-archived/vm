#! /bin/sh

set -e

# cp
sudo cp -r /media/sf_sync/settings /tmp/
sudo chown -R $USER:$USER /tmp/settings
find /tmp/settings/ -type f | xargs chmod 644
cp -r /tmp/settings/dotfiles/.[!.]* ~
rm -rf /tmp/settings

# etc
mkdir -p ~/bin ~/code ~/sandbox
sudo timedatectl set-timezone Asia/Tokyo
sudo groupadd docker || :
sudo usermod -aG docker $USER
sudo usermod -aG vboxsf $USER

# network
echo nameserver 8.8.8.8 | sudo tee /etc/resolv.conf
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
sudo snap install docker

# after package
byobu || :
byobu-enable
byobu-disable-prompt
curl 'http://vim-bootstrap.com/generate.vim' -d 'editor=vim' > ~/.vimrc

echo success
