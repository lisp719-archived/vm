#! /bin/sh

set -e

sudo dnf install -y \
  debootstrap \
  gnupg \
  systemd-container

# sudo debootstrap stable ./my_dc http://ftp.jp.debian.org/debian/

