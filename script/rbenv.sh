#! /bin/sh

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

echo install: -N >> .gemrc
echo update: -N >> .gemrc

# curl -fsSL https://gist.github.com/mislav/055441129184a1512bb5.txt | rbenv install --patch 2.1.5
# rbenv global 2.1.5
