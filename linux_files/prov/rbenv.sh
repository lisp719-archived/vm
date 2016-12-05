#! /bin/sh

sudo dnf install -y \
  gcc\
  bzip2\
  openssl-devel\
  libyaml-devel\
  libffi-devel\
  readline-devel\
  zlib-devel\
  gdbm-devel\
  ncurses-devel

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

echo >> ~/.bashconf
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashconf
echo 'eval "$(rbenv init -)"' >> ~/.bashconf

. ~/.bashconf

echo install: -N >> ~/.gemrc
echo update: -N >> ~/.gemrc

# CONFIGURE_OPTS="--disable-install-rdoc" rbenv install 2.1.5
# rbenv global 2.1.5
# gem i bundler
