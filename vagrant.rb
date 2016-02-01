Vagrant.configure(2) do |config|
  config.vm.box = "ogarcia/archlinux-201510-x64"
  config.vm.network "forwarded_port", guest: 3449, host: 3449
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder '.', '/home/vagrant/sync'

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  pacman_script = '
    sudo pacman -S --noconfirm   ruby nodejs npm  \
      jdk8-openjdk  \
      php
  '

  config_script = '
    echo >> ~/.bash_profile
    curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/add_bash_profile >> ~/.bash_profile
    curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/.tmux.conf -o ~/.tmux.conf
    curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/.gemrc -o ~/.gemrc
    curl https://raw.githubusercontent.com/lisp719/conf/master/linux_files/.npmrc -o ~/.npmrc
  '

  cli_script = '
    gem i thor pry bundler

    mkdir bin
    git clone https://github.com/lisp719/cli.git ~/bin/cli
  '

  lein_script = '
    curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -o ~/bin/lein
    chmod a+x ~/bin/lein
    ~/bin/lein
  '



  config.vm.provision "shell", privileged: false, path: "script/base.sh"
  config.vm.provision "shell", privileged: false, path: "script/db.sh"
  config.vm.provision "shell", privileged: false, path: "script/emacs.sh"
end
