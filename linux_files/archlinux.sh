#! /bin/sh

set -e

# common
~/linux_files/cp_dotfiles.sh
cp /vagrant/.ssh/* ~/.ssh/ && chmod 600 ~/.ssh/*
mkdir -p ~/bin ~/code
sudo timedatectl set-timezone Asia/Tokyo
sudo rm /etc/resolv.conf && echo nameserver 8.8.8.8 | sudo tee /etc/resolv.conf

# package
sudo cp ~/linux_files/mirrorlist /etc/pacman.d/mirrorlist
sudo pacman-key --refresh-keys
curl https://pkgbuild.com/~eschwartz/repo/x86_64-extracted/pacman-static -o /tmp/pacman-static
chmod +x /tmp/pacman-static
sudo /tmp/pacman-static -Syy
sudo /tmp/pacman-static -S archlinux-keyring --noconfirm
sudo /tmp/pacman-static -Syu --noconfirm
sudo pacman -R --noconfirm virtualbox-guest-utils-nox || :
sudo pacman -S --noconfirm --needed \
  atool \
  base-devel \
  bash-completion \
  docker \
  docker-compose \
  fcitx-configtool \
  fcitx-im \
  fcitx-mozc \
  fd \
  fzf \
  git \
  htop \
  meld \
  openbox \
  prettier \
  ranger \
  rofi \
  sddm \
  tig \
  tk \
  tree \
  unzip \
  tilda \
  w3m \
  wget \
  vim \
  virtualbox-guest-utils \
  adobe-source-code-pro-fonts \
  adobe-source-han-sans-jp-fonts \
  noto-fonts-emoji \
  terminus-font

# other package
type yay || bash -c "cd /tmp; git clone https://aur.archlinux.org/yay-bin.git; cd yay-bin; makepkg -si --noconfirm"
yay -S --needed --noconfirm \
  byobu \
  sublime-text-dev \
  visual-studio-code-bin

# after package
code --install-extension esbenp.prettier-vscode
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode.sublime-keybindings
code --install-extension tranhl.find-then-jump
curl 'http://vim-bootstrap.com/generate.vim' -d 'editor=vim' > ~/.vimrc
sudo cp -r  ~/linux_files/system/* /etc/systemd/system/
sudo systemctl enable docker
sudo systemctl enable sddm
sudo usermod -aG docker vagrant
type subl || sudo ln -s /bin/subl3 /bin/subl
wget https://packagecontrol.io/Package%20Control.sublime-package -qP ~/.config/sublime-text-3/Installed\ Packages/

echo success
