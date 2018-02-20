#! /bin/sh

set -e

# common
cp -r ~/linux_files/dotfiles/.[!.]* ~
cp /vagrant/.ssh/* ~/.ssh/ && chmod 600 ~/.ssh/*
mkdir -p ~/bin ~/code/sandbox
sudo timedatectl set-timezone Asia/Tokyo
sudo rm /etc/resolv.conf || : && echo nameserver 8.8.8.8 | sudo tee /etc/resolv.conf

# package
sudo dnf install -y \
  atool \
  bash-completion \
  curl \
  fcitx-kkc \
  git \
  gitk \
  git-gui \
  htop \
  meld \
  ranger \
  tig \
  tree \
  unzip \
  terminator \
  wget \
  vim
exit 0

sudo cp ~/linux_files/mirrorlist /etc/pacman.d/mirrorlist
sudo pacman -Syyu --noconfirm
sudo pacman -R --noconfirm virtualbox-guest-utils-nox || :
sudo pacman -S --noconfirm \
  atool \
  bash-completion \
  curl \
  docker \
  docker-compose \
  emacs \
  fcitx-configtool \
  fcitx-gtk3 \
  fcitx-mozc \
  fd \
  fzf \
  git \
  htop \
  lxde \
  nodejs \
  npm \
  ranger \
  tig \
  tree \
  unzip \
  meld \
  terminator \
  wget \
  vim \
  virtualbox-guest-utils \
  adobe-source-code-pro-fonts \
  otf-ipafont

sudo npm i -g http-server prettier

# emacs
git clone --depth 1 https://github.com/syl20bnr/spacemacs ~/.emacs.d

# gibo
curl -L https://raw.github.com/simonwhitaker/gibo/master/gibo -o ~/bin/gibo
chmod +x ~/bin/gibo
~/bin/gibo -u

echo -e "\n[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/\$arch" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu --noconfirm yaourt
yaourt -Syua

sudo systemctl enable docker
sudo systemctl enable lxdm
sudo usermod -aG docker vagrant

# subl
# curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
# echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
# sudo pacman -Syu --noconfirm sublime-text
# wget https://packagecontrol.io/Package%20Control.sublime-package -P ~/.config/sublime-text-3/Installed\ Packages/

exit 0

# code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install -y code
code --install-extension esbenp.prettier-vscode
code --install-extension ms-vscode.sublime-keybindings
