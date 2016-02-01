#! /bin/sh

sudo pacman -S --noconfirm jdk8-openjdk

curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -o ~/bin/lein
chmod a+x ~/bin/lein
~/bin/lein
