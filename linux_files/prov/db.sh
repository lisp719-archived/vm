#! /bin/sh

sudo dnf install -y \
  mariadb-server \
  redis

sudo systemctl start mariadb
sudo systemctl start redis
sudo systemctl enable mariadb
sudo systemctl enable redis
