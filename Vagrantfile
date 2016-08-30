Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.synced_folder './linux_files', '/home/vagrant/linux_files'
  config.vm.synced_folder '../sync', '/vagrant'
  config.vm.provider("virtualbox") { |vb| vb.gui = true }
  config.vm.provider("virtualbox") { |vb| vb.cpus = 2 }

  main_vm = false

  if main_vm
    config.vm.network "forwarded_port", guest: 3000, host: 3000
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.provider("virtualbox") { |vb| vb.memory = 1024 * 2 }
  else
    config.vm.network "private_network", ip: "192.168.33.11"
    config.vm.provider("virtualbox") { |vb| vb.memory = 1024 * 1 }
  end

  prov = 'linux_files/prov'
  # config.vm.provision "shell", privileged: false, path: "#{prov}/base.sh"
  # config.vm.provision "shell", privileged: false, path: "#{prov}/gui.sh"
  # config.vm.provision "shell", privileged: false, path: "#{prov}/rbenv.sh"
  # config.vm.provision "shell", privileged: false, path: "#{prov}/db.sh"
end
