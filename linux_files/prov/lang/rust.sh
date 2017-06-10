#! /bin/sh

set -e

sudo dnf install -y \
  gcc

curl https://sh.rustup.rs -sSf | sh -s -- -y

echo >> ~/.bashconf
echo '. ~/.profile' >> ~/.bashconf
