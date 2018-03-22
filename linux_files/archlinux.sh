#! /bin/sh

set -e

# common
cp -r ~/linux_files/dotfiles/.[!.]* ~
cp /vagrant/.ssh/* ~/.ssh/ && chmod 600 ~/.ssh/*
mkdir -p ~/bin ~/code
sudo timedatectl set-timezone Asia/Tokyo
sudo rm /etc/resolv.conf && echo nameserver 8.8.8.8 | sudo tee /etc/resolv.conf

# package
sudo cp ~/linux_files/mirrorlist /etc/pacman.d/mirrorlist
type yaourt || echo -e "\n[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/\$arch" | sudo tee -a /etc/pacman.conf
sudo pacman -Syyu --noconfirm
sudo pacman -R --noconfirm virtualbox-guest-utils-nox || :
sudo pacman -S --noconfirm --needed \
  atool \
  base-devel \
  bash-completion \
  curl \
  docker \
  docker-compose \
  emacs \
  fcitx-configtool \
  fcitx-im \
  fcitx-mozc \
  fd \
  fzf \
  git \
  htop \
  lxde \
  meld \
  npm \
  ranger \
  tig \
  tk \
  tree \
  unzip \
  terminator \
  wget \
  vim \
  virtualbox-guest-utils \
  yaourt \
  adobe-source-code-pro-fonts \
  adobe-source-han-sans-jp-fonts \
  terminus-font \
  ttf-symbola

# other package
yaourt -Syua
yaourt -S --noconfirm --needed \
  sublime-text-dev

# after package
curl 'http://vim-bootstrap.com/generate.vim' -d 'editor=vim' > ~/.vimrc
curl -sL https://raw.github.com/simonwhitaker/gibo/master/gibo -o ~/bin/gibo && chmod +x ~/bin/gibo && ~/bin/gibo -u
test -d ~/.emacs.d || git clone --depth 1 https://github.com/syl20bnr/spacemacs ~/.emacs.d
sudo cp -r  ~/linux_files/system/* /etc/systemd/system/
sudo npm i -g http-server npm prettier
sudo systemctl enable docker
sudo systemctl enable lxdm
sudo usermod -aG docker vagrant
type subl || sudo ln -s /bin/subl3 /bin/subl
wget https://packagecontrol.io/Package%20Control.sublime-package -qP ~/.config/sublime-text-3/Installed\ Packages/

echo success
