Vagrant.configure(2) do |config|
  config.vm.box = "ogarcia/archlinux-201510-x64"
  config.vm.network "forwarded_port", guest: 3449, host: 3449
  config.vm.network "private_network", ip: "192.168.33.10"
  config.ssh.forward_agent = true
  config.vm.synced_folder '.', '/home/vagrant/sync'

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision "shell", privileged: false, path: "script/base.sh"
  config.vm.provision "shell", privileged: false, path: "script/rbenv.sh"
  config.vm.provision "shell", privileged: false, path: "script/db.sh"
  config.vm.provision "shell", privileged: false, path: "script/lein.sh"
  config.vm.provision "shell", privileged: false, path: "script/go.sh"
  config.vm.provision "shell", privileged: false, path: "script/docker.sh"
  config.vm.provision "shell", privileged: false, path: "script/emacs.sh"
end
