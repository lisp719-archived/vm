#! /bin/sh

sudo sed -i.bak -e "s%http://us.archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y \
  git \
  nodejs


git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo timedatectl set-timezone Asia/Tokyo

git config --global user.name lisp719
git config --global user.email test@example.com
git config --global push.default simple
git config --global core.editor nano
git config --global core.excludesfile ~/.gitignore
touch ~/.gitignore

mkdir ~/bin
git clone https://github.com/lisp719/cli.git ~/bin/cli

cp ~/linux_files/.tmux.conf ~/.tmux.conf
cp ~/linux_files/.bashconf ~/.bashconf

echo >> ~/.bashrc
echo '. ~/.bashconf' >> ~/.bashrc
