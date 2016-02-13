#!/bin/sh

sudo pacman -S --noconfirm docker
sudo systemctl start docker
sudo systemctl enable docker
sudo gpasswd -a vagrant docker
