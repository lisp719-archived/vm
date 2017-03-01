#! /bin/sh

sudo dnf update -y \
  vim-minimal
sudo dnf install -y \
  git \
  highlight \
  nano \
  ranger \
  tig \
  tmux \
  tree \
  unzip \
  vim

sudo timedatectl set-timezone Asia/Tokyo

mkdir ~/bin ~/sandbox ~/projects

git clone https://lisp719@bitbucket.org/lisp719/cli.git ~/bin/cli

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

touch ~/.gitignore
cp ~/linux_files/conf/.bashconf ~/.bashconf
cp ~/linux_files/conf/.gitconfig ~/.gitconfig
cp ~/linux_files/conf/.tmux.conf ~/.tmux.conf

echo >> ~/.bashrc
echo '. ~/.bashconf' >> ~/.bashrc

cd ~/.ssh/
cp /vagrant/.ssh/* .
chmod 600 config id_rsa
