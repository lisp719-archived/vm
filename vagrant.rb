# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ogarcia/archlinux-201510-x64"
  config.vm.network "forwarded_port", guest: 3449, host: 3449
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision "shell", privileged: false, inline: '
cat << EOF >> .bash_profile
PATH=$HOME/bin:\$PATH
PATH=$HOME/bin/cli:\$PATH
PATH=$(ruby -e \'print Gem.user_dir\')/bin:\$PATH
PATH=$HOME/.npm/bin:\$PATH
EOF

cat << EOF > .tmux.conf
unbind C-b
set -g prefix C-t
setw -g mode-keys vi
bind-key c new-window -c "#{pane_current_path}"
bind-key % split-window -h -c "#{pane_current_path}"
bind-key \'"\' split-window -v -c "#{pane_current_path}"
EOF

cat << EOF > .gemrc
install: -N
update: -N
EOF

echo prefix=~/.npm > .npmrc
  '

  config.vm.provision "shell", privileged: false, inline: '
    sudo pacman -Syu
    sudo pacman -S --noconfirm tmux git ruby nodejs npm curl \
      jdk8-openjdk mongodb postgresql sqlite mariadb unzip python2 \
      php apache nginx tree tig

    git config --global user.name lisp719
    git config --global user.email test@example.com

    gem i thor pry bundler
    npm i browser-sync -g

    mkdir bin
    git clone https://github.com/lisp719/cli.git ~/bin/cli

    curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -o ~/bin/lein
    chmod a+x ~/bin/lein
    ~/bin/lein
  '
end
