#! /bin/sh

set -e

sudo dnf install -y \
  debootstrap \
  gnupg \
  systemd-container

mkdir ~/container
# sudo debootstrap stable ./debian http://ftp.jp.debian.org/debian/
