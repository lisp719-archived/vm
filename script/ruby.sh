#! /bin/sh

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

source ~/.bash_profile
rbenv install 2.2.4
rbenv global 2.2.4

echo install: -N >> .gemrc
echo update: -N >> .gemrc

gem i \
  bundler \
  pry \
  thor

git clone https://github.com/lisp719/cli.git ~/bin/cli
echo 'PATH=$HOME/bin/cli:$PATH' >> ~/.bash_profile
