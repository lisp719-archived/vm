#! /bin/sh

sudo dnf install -y \
  git \
  nano \
  tig \
  tmux

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

sudo timedatectl set-timezone Asia/Tokyo

git config --global user.name lisp719
git config --global user.email test@example.com
git config --global push.default simple
git config --global core.editor nano
git config --global core.excludesfile ~/.gitignore
touch ~/.gitignore

mkdir ~/bin
git clone https://lisp719@bitbucket.org/lisp719/cli.git ~/bin/cli

cp ~/linux_files/conf/.tmux.conf ~/.tmux.conf
cp ~/linux_files/conf/.bashconf ~/.bashconf

echo >> ~/.bashrc
echo '. ~/.bashconf' >> ~/.bashrc

mkdir ~/sandbox

cd ~/.ssh/
cp /vagrant/.ssh/* .
chmod 600 id_rsa
