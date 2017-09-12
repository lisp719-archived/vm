#! /bin/sh

set -e

sudo dnf install -y \
  mariadb-server \
  mariadb-devel

sudo systemctl start mariadb
sudo systemctl enable mariadb
