#! /bin/sh

set -e

# network
echo nameserver 8.8.8.8 | sudo tee /etc/resolv.conf
sudo sed -i.bak -e 's%http://\S\+%mirror://mirrors.ubuntu.com/mirrors.txt%g' /etc/apt/sources.list

# package
sudo add-apt-repository -y ppa:git-core/ppa
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
  w3m \
  vim

# docker
sudo addgroup --system docker
sudo adduser $USER docker
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
sudo sh /tmp/get-docker.sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# byobu
byobu || :
byobu-ctrl-a emacs
byobu-disable-prompt
byobu-enable

# etc
cp -r /media/sf_sync/dotfiles/.[!.]* ~
curl 'https://vim-bootstrap.com/generate.vim' -d 'editor=vim' > ~/.vimrc
mkdir -p ~/bin ~/sandbox  ~/workspace
sudo timedatectl set-timezone Asia/Tokyo

echo success
