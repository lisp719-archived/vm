#! /bin/sh

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y \
  lib32stdc++6 \
  lib32z1 \
  oracle-java7-installer

cp /vagrant/android-studio.zip ~/sandbox/
unzip ~/sandbox/android-studio.zip
rm ~/sandbox/android-studio.zip

ln -s /home/vagrant/android-studio/bin/studio.sh /home/vagrant/bin/studio
