#! /bin/sh

echo "mysql-server-5.6 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.6 mysql-server/root_password_again password root" | sudo debconf-set-selections

sudo apt-get install -y \
  libpq-dev \
  libmysqlclient-dev \
  libsqlite3-dev \
  mysql-server-5.6 \
  postgresql

sudo su -c "createuser -s vagrant" postgres
