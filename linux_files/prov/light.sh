#! /bin/sh

set -e

sudo dnf install -y \
  alsa-lib \
  GConf2

url=https://github.com/LightTable/LightTable/releases/download/0.8.1/lighttable-0.8.1-linux.tar.gz

cd /tmp
wget $url -O lighttable.tar.gz
atool -x lighttable.tar.gz
sudo mv lighttable-0.8.1-linux /opt/lighttable
sudo ln -s /opt/lighttable/light /usr/bin/

# mkdir -p ~/.config/LightTable/User/
# cp ~/linux_files/conf/light/* ~/.config/LightTable/User/
