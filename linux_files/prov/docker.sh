#! /bin/sh

curl -fsSL https://get.docker.com/ | sh
sudo systemctl enable docker.service
sudo systemctl start docker
