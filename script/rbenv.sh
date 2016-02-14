#! /bin/sh

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

echo install: -N >> .gemrc
echo update: -N >> .gemrc
