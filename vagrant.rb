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
      php tree tig emacs
  '

  config_script = '
    echo >> ~/.bash_profile
    curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/add_bash_profile >> ~/.bash_profile

    curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/.tmux.conf -o ~/.tmux.conf

    curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/.gemrc -o ~/.gemrc

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

  emacs_script = '
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    curl curl https://raw.githubusercontent.com/lisp719/conf/master/init.el -o .emacs.d/init.el
  '

  config.vm.provision "shell", privileged: false, inline: pacman_script
  config.vm.provision "shell", privileged: false, inline: config_script
  config.vm.provision "shell", privileged: false, inline: cli_script
  config.vm.provision "shell", privileged: false, inline: lein_script
  config.vm.provision "shell", privileged: false, inline: db_script
  config.vm.provision "shell", privileged: false, inline: emacs_script
end
