#! /bin/sh

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
  curl \
  git \
  libreadline-dev \
  libsqlite3-dev \
  libmysqlclient-dev \
  libssl-dev \
  mysql-server \
  nodejs \
  sqlite \
  tig \
  tree \
  unzip \
  zlib1g-dev

git config --global user.name lisp719
git config --global user.email test@example.com
git config --global push.default simple
git config --global core.editor nano

mkdir ~/bin
git clone https://github.com/lisp719/cli.git ~/bin/cli

echo >> ~/.bash_profile
echo '. ~/.bashconf' >> ~/.bash_profile

curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/.tmux.conf -o ~/.tmux.conf
curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/.bashconf -o ~/.bashconf

source ~/.bash_profile

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

echo install: -N >> .gemrc
echo update: -N >> .gemrc

mkdir sandbox
