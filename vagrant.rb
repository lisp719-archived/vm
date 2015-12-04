Vagrant.configure(2) do |config|
  config.vm.box = "ogarcia/archlinux-201510-x64"
  config.vm.network "forwarded_port", guest: 3449, host: 3449
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder '.', '/home/vagrant/sync'

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  pacman_script = '
    sudo pacman -Syu
    sudo pacman -S --noconfirm tmux git ruby nodejs npm curl \
      jdk8-openjdk mongodb postgresql sqlite mariadb unzip \
      php tree tig
  '

  config_script = '
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
set -g base-index 1
set -g pane-base-index 1
EOF

cat << EOF > .gemrc
install: -N
update: -N
EOF

echo prefix=~/.npm > .npmrc
  '

  cli_script = '
    git config --global user.name lisp719
    git config --global user.email test@example.com
    git config --global push.default simple

    gem i thor pry bundler

    mkdir bin
    git clone https://github.com/lisp719/cli.git ~/bin/cli
  '

  lein_script = '
    curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -o ~/bin/lein
    chmod a+x ~/bin/lein
    ~/bin/lein
  '

  db_script = '
    sudo su -c "initdb --locale en_US.UTF-8 -E UTF8 -D \'/var/lib/postgres/data\'" postgres
    sudo systemctl start postgresql.service
    sudo systemctl enable postgresql.service

    sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    sudo systemctl start mysqld.service
    sudo systemctl enable mysqld.service

    sudo systemctl start mongodb.service
    sudo systemctl enable mongodb.service
  '

  config.vm.provision "shell", privileged: false, inline: pacman_script
  config.vm.provision "shell", privileged: false, inline: config_script
  config.vm.provision "shell", privileged: false, inline: cli_script
  config.vm.provision "shell", privileged: false, inline: lein_script
  config.vm.provision "shell", privileged: false, inline: db_script
end
