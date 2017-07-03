#! /bin/sh

set -e

sudo dnf install -y \
  debootstrap \
  gnupg \
  systemd-container

mkdir ~/container
# sudo debootstrap stable ~/container/debian http://ftp.jp.debian.org/debian/
# sudo dnf -y --releasever=24 --installroot=$HOME/container/fedora --disablerepo='*' --enablerepo=fedora --enablerepo=updates install systemd passwd dnf fedora-release nano
