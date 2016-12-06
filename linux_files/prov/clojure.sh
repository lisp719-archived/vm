#! /bin/sh

sudo dnf install -y \
  java-1.8.0-openjdk

curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -o ~/bin/lein
chmod a+x ~/bin/lein
lein
