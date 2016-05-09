#! /bin/sh

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
  libpq-dev \
  libmysqlclient-dev \
  libsqlite3-dev \
  mysql-server-5.6 \
  postgresql

sudo sed -i.bak -e "/^\[mysqld\]$/a table_definition_cache = 400" /etc/mysql/my.cnf
sudo sed -i.bak -e "/^\[mysqld\]$/a default-time-zone = '+0:00'" /etc/mysql/my.cnf
sudo service mysql restart

sudo su -c "createuser -s vagrant" postgres
