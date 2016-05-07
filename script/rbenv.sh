# ! /bin/sh

sudo apt-get install -y \
  build-essential \
  libreadline-dev \
  libssl-dev \
  libxml2-dev \
  zlib1g-dev

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

echo >> .bashconf
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> .bashconf
echo 'eval "$(rbenv init -)"' >> .bashconf

. ~/.bashconf

echo install: -N >> .gemrc
echo update: -N >> .gemrc

# CONFIGURE_OPTS="--disable-install-rdoc" rbenv install 2.1.5
# rbenv global 2.1.5
# gem i bundler
