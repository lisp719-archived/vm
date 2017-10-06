#! /bin/sh

set -e

cd ~/.ssh/
cp /vagrant/.ssh/* .
chmod 600 config id_rsa

sudo dnf update -y \
  vim-minimal
sudo dnf install -y \
  atool \
  git \
  highlight \
  htop \
  nano \
  python \
  ranger \
  tig \
  tree \
  unzip \
  vim \
  wget

sudo timedatectl set-timezone Asia/Tokyo

mkdir ~/bin ~/code

git clone git@bitbucket.org:lisp719/cli.git ~/bin/cli

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

touch ~/.gitignore
cp ~/linux_files/conf/.bashconf ~/.bashconf
cp ~/linux_files/conf/.gitconfig ~/.gitconfig

echo >> ~/.bashrc
echo '. ~/.bashconf' >> ~/.bashrc
