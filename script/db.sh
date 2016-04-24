#! /bin/sh

sudo pacman -S --noconfirm \
  mariadb \
  postgresql \
  sqlite

sudo su -c "initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'" postgres
sudo systemctl start postgresql.service
sudo systemctl enable postgresql.service

sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mysqld.service
sudo systemctl enable mysqld.service
