Vagrant.configure(2) do |config|
  # VagrantCloudは速度が安定しないのでOneDrive
  config.vm.box = 'bento_fedora25'
  config.vm.box_url = File.join('file:///', Dir.home, 'OneDrive', 'init', 'bento_fedora25.box')
  config.vm.box_check_update = false

  config.vm.synced_folder './linux_files', '/home/vagrant/linux_files', type: 'virtualbox'
  config.vm.synced_folder '/sync', '/vagrant', type: 'virtualbox'

  config.vm.provider("virtualbox") do |vb|
    vb.gui = true
    vb.cpus = 2
    vb.memory = 1024 * 2
  end

  if true
    port_config = -> (port) { config.vm.network "forwarded_port", guest: port, host: port }
    [3000, 3001, 3002, 3003, 3449, 8000, 8080].each(&port_config)
    config.vm.network "private_network", ip: "192.168.33.10"
  else
    config.vm.network "private_network", ip: "192.168.33.11"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--vram", "64"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end

  # 起動のたびにresolv.confが書き換えられるからrun: 'always'
  config.vm.provision 'shell', run: 'always', inline: 'echo nameserver 8.8.8.8 > /etc/resolv.conf'
end
