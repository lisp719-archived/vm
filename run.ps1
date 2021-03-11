$config = @{
  VmName = "vm"
  Box    = @{
    Org     = "bento"
    Name    = "ubuntu-20.04"
    Version = "202008.16.0"
  }
  Ports  = 2800, 3000, 3035, 3333, 8000, 8080
  Cpus   = 2
  Memory = 1024 * 3
}

Function Create() {
  $boxDir = ".box"
  $boxPath = "${boxDir}/box.tar"

  if (!(Test-Path $boxPath)) {
    $url = "https://app.vagrantup.com/{0}/boxes/{1}/versions/{2}/providers/virtualbox.box" -f $config.Box.Org, $config.Box.Name, $config.Box.Version

    mkdir -Force $boxDir
    Invoke-WebRequest $url -OutFile $boxPath
    tar -xf $boxPath -C $boxDir
  }

  $ovfPath = "${boxDir}/box.ovf"
  $ovfFile = [xml](Get-Content $ovfPath)
  $originalName = $ovfFile.Envelope.VirtualSystem.Machine.name

  VBoxManage import $ovfPath --options importtovdi
  VBoxManage modifyvm $originalName --name $config.VmName

  VBoxManage modifyvm $config.VmName --natpf1 "ssh,tcp,,2222,,22"

  foreach ($port in $config.Ports) {
    VBoxManage modifyvm $config.VmName --natpf1 "tcp${port},tcp,,${port},,${port}"
  }

  VBoxManage sharedfolder add $config.VmName --name sync --hostpath . --automount

  VBoxManage modifyvm $config.VmName --memory $config.Memory
  VBoxManage modifyvm $config.VmName --cpus $config.Cpus
  VBoxManage modifyvm $config.VmName --defaultfrontend headless

  VBoxManage startvm $config.VmName
}

function Modify() {
  VBoxManage modifyvm $config.VmName --memory $config.Memory
  VBoxManage modifyvm $config.VmName --cpus $config.Cpus
}

$sshConfig = @'
Host vm
  HostName 127.0.0.1
  Port 2222
  User vagrant
  IdentityFile ~/.ssh/vagrant
'@

$sftpTask = @'
lcd ~
mput .ssh/id_rsa* .ssh/
chmod 600 .ssh/*
'@

switch ($Args[0]) {
  "create" {
    Create
  }
  "down" {
    VBoxManage controlvm $config.VmName acpipowerbutton
  }
  "init" {
    [Text.Encoding]::UTF8.GetBytes($sshConfig) | Add-Content ~/.ssh/config -Encoding Byte
    Invoke-WebRequest "https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant" -OutFile ~/.ssh/vagrant
  }
  "modify" {
    Modify
  }
  "rm" {
    VBoxManage controlvm $config.VmName poweroff
    VBoxManage unregistervm $config.VmName --delete

    $vmDir = "~/VirtualBox VMs/$($config.VmName)"

    if (Test-Path $vmDir) {
      Remove-Item $vmDir
    }
  }
  "setup" {
    $sshHost = "vm"

    ssh $sshHost sudo usermod -aG vboxsf `$USER
    ssh $sshHost sh /media/sf_sync/setup.sh
    Write-Output $sftpTask | sftp $sshHost
  }
  "status" {
    VBoxManage.exe showvminfo $config.VmName --machinereadable | Select-String "VMState="
  }
  "stop" {
    VBoxManage controlvm $config.VmName savestate
  }
  "target" {
    Write-Output $config.VmName
  }
  "up" {
    VBoxManage startvm $config.VmName
  }
}
