#! /bin/sh

set -e

sudo dnf install -y \
  mongodb \
  mongodb-server

sudo systemctl start mongod
sudo systemctl enable mongod
