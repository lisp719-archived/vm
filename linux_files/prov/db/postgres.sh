#! /bin/sh

set -e

sudo dnf install -y \
  postgresql-devel \
  postgresql-server

sudo postgresql-setup --initdb

sudo systemctl start postgresql
sudo systemctl enable postgresql

cd /tmp
sudo su -c "createuser -s vagrant" postgres
createdb vagrant
