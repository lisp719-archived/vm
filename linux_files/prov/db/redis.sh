#! /bin/sh

set -e

sudo dnf install -y \
  redis

sudo systemctl start redis
sudo systemctl enable redis
