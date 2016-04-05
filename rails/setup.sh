#! /bin/sh

sudo sed -i -e "1i Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/\$repo/os/\$arch" /etc/pacman.d/mirrorlist
sudo sed -i -e "2i Server = ftp://ftp.jaist.ac.jp/pub/Linux/ArchLinux/core/os/\$arch" /etc/pacman.d/mirrorlist

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm \
  fzf \
  mariadb \
  nodejs \
  unzip

git config --global user.name lisp719
git config --global user.email test@example.com
git config --global push.default simple
git config --global core.editor nano

mkdir ~/bin
git clone https://github.com/lisp719/cli.git ~/bin/cli

echo >> ~/.bash_profile
echo '. ~/.bashconf' >> ~/.bash_profile

curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/.tmux.conf -o ~/.tmux.conf
curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/.bashconf -o ~/.bashconf

source ~/.bash_profile

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

echo install: -N >> .gemrc
echo update: -N >> .gemrc

mkdir sandbox

sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mysqld.service
sudo systemctl enable mysqld.service

# curl -fsSL https://gist.github.com/mislav/055441129184a1512bb5.txt | rbenv install --patch 2.1.5
# rbenv global 2.1.5
