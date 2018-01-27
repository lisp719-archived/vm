#! /bin/sh

set -e

sudo dnf install -y \
  mariadb-server \
  mariadb-devel \
  redis \
  sqlite \
  sqlite-devel

sudo systemctl start mariadb
sudo systemctl enable mariadb

sudo systemctl start redis
sudo systemctl enable redis
