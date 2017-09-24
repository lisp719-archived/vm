#! /bin/sh

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
sudo dnf install -y code

mkdir -p ~/.config/Code/User
wget https://bitbucket.org/lisp719/win/raw/master/vscode/settings.json -O ~/.config/Code/User/settings.json

code --install-extension ms-vscode.sublime-keybindings
code --install-extension sbrink.elm
