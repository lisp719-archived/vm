Vagrant.configure(2) do |config|
  config.vm.box = 'archlinux'
  config.vm.box_url = File.join('file:///', Dir.home, 'OneDrive', 'init', 'archlinux.box')
  config.vm.box_check_update = false

  config.vm.synced_folder './linux_files', '/home/vagrant/linux_files', type: 'virtualbox'
  config.vm.synced_folder '/sync', '/vagrant', type: 'virtualbox'

  config.vm.provider("virtualbox") do |vb|
    vb.gui = true
    vb.cpus = 2
    vb.memory = 1024 * 3
  end

  [3000, 3035, 8000, 8080].each do |port|
    config.vm.network "forwarded_port", guest: port, host: port
  end

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    vb.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--vram", "64"]
    vb.customize ["modifyvm", :id, "--clipboard-mode", "bidirectional"]
  end

  config.vm.provision "shell", privileged: false, inline: '~/linux_files/archlinux.sh'
end
