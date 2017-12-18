#! /bin/sh

set -e

sudo dnf install -y \
  mariadb-server \
  mariadb-devel \
  postgresql-devel \
  postgresql-server \
  redis \
  sqlite \
  sqlite-devel

sudo systemctl start mariadb
sudo systemctl enable mariadb

sudo systemctl start redis
sudo systemctl enable redis

sudo postgresql-setup --initdb
sudo systemctl start postgresql
sudo systemctl enable postgresql
sudo su - -c "createuser -s vagrant" postgres
createdb vagrant
