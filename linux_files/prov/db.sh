#! /bin/sh

set -e

sudo dnf install -y \
  mariadb-server \
  mariadb-devel \
  postgresql-server \
  redis \
  sqlite \
  sqlite-devel

sudo postgresql-setup --initdb

sudo systemctl start mariadb
sudo systemctl start postgresql
sudo systemctl start redis
sudo systemctl enable mariadb
sudo systemctl enable postgresql
sudo systemctl enable redis

cd /tmp
sudo su -c "createuser -s vagrant" postgres
createdb vagrant
