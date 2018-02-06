#! /bin/sh

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
sudo dnf install -y code

mkdir -p ~/.config/Code/User
cp ~/linux_files/conf/vscode/* ~/.config/Code/User/

code --install-extension esbenp.prettier-vscode
code --install-extension ms-vscode.sublime-keybindings
