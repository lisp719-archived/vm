#! /bin/sh

curl -fsSL https://get.docker.com/ | sh
sudo systemctl enable docker.service

sudo usermod -aG docker vagrant
sudo curl -L "https://github.com/docker/compose/releases/download/1.16.1/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
