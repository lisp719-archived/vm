Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "private_network", ip: "192.168.33.10"

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.synced_folder '../sync', '/vagrant'
  config.vm.synced_folder './linux_files', '/home/vagrant/linux_files'

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 512 * 4
    vb.gui = true
  end

  config.vm.provision "shell", privileged: false, path: "script/base.sh"
  # config.vm.provision "shell", privileged: false, path: "script/rbenv.sh"
  # config.vm.provision "shell", privileged: false, path: "script/db.sh"
  # config.vm.provision "shell", privileged: false, path: "script/gui.sh"
end
