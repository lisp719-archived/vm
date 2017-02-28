Vagrant.configure(2) do |config|
  config.vm.box = "boxcutter/fedora24"
  config.vm.box_check_update = false

  config.vm.synced_folder './linux_files', '/home/vagrant/linux_files'
  config.vm.synced_folder '../sync', '/vagrant'

  config.vm.provider("virtualbox") do |vb|
    vb.gui = true
    vb.cpus = 2
    vb.memory = 1024 * 2
  end

  if true
    port_config = -> (port) { config.vm.network "forwarded_port", guest: port, host: port }
    [3000, 3449, 8080].each(&port_config)
    config.vm.network "private_network", ip: "192.168.33.10"
  else
    config.vm.network "private_network", ip: "192.168.33.11"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--vram", "64"]
  end

  prov = 'linux_files/prov'
  # config.vm.provision "shell", privileged: false, path: "#{prov}/base.sh"

  # config.vm.provision "shell", privileged: false, path: "#{prov}/db.sh"
  # config.vm.provision "shell", privileged: false, path: "#{prov}/docker.sh"
  # config.vm.provision "shell", privileged: false, path: "#{prov}/emacs.sh"
  # config.vm.provision "shell", privileged: false, path: "#{prov}/gui.sh"
  # config.vm.provision "shell", privileged: false, path: "#{prov}/subl.sh"

  # config.vm.provision "shell", privileged: false, path: "#{prov}/lang/node.sh"
  # config.vm.provision "shell", privileged: false, path: "#{prov}/lang/npm/elm.sh"

  # config.vm.provision "shell", privileged: false, path: "#{prov}/lang/clojure.sh"
  # config.vm.provision "shell", privileged: false, path: "#{prov}/lang/rbenv.sh"
  config.vm.provision "shell", inline: "systemctl restart network", run: "always"
end
