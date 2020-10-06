$boxDir = ".box"
$vmName = "vm"

Function Fetch() {
  $url = "https://app.vagrantup.com/bento/boxes/ubuntu-20.04/versions/202008.16.0/providers/virtualbox.box"
  $boxPath = "${boxDir}/box.tar"

  mkdir $boxDir
  Invoke-WebRequest $url -o $boxPath
  tar -xf $boxPath -C $boxDir
}

Function Create() {
  $ovfPath = "${boxDir}/box.ovf"
  $ofvFile = [xml](Get-Content $ovfPath)
  $originalName = $ofvFile.Envelope.VirtualSystem.Machine.name

  VBoxManage import $ovfPath --options importtovdi
  VBoxManage modifyvm $originalName --name $vmName

  VBoxManage modifyvm $vmName --natpf1 "ssh,tcp,,2222,,22"

  $ports = 2800, 3000, 3035, 3333, 8000, 8080

  foreach ($port in $ports) {
    VBoxManage modifyvm $vmName --natpf1 "tcp${port},tcp,,${port},,${port}"
  }

  VBoxManage sharedfolder add $vmName --name sync --hostpath . --automount

  VBoxManage modifyvm $vmName --memory (1024 * 3)
  VBoxManage modifyvm $vmName --cpus 2
  VBoxManage modifyvm $vmName --defaultfrontend headless

  VBoxManage startvm $vmName
}

switch ($Args[0]) {
  "fetch" {
    Fetch
  }
  "create" {
    Create
  }
  "rm" {
    VBoxManage controlvm $vmName poweroff
    VBoxManage unregistervm $vmName --delete
  }
  "up" {
    VBoxManage startvm $vmName
  }
  "stop" {
    VBoxManage controlvm $vmName savestate
  }
  "down" {
    VBoxManage controlvm $vmName poweroff
  }
  "setup" {
    $sshHost = "vm"

    ssh $sshHost sudo usermod -aG vboxsf `$USER
    ssh $sshHost sh /media/sf_sync/setup.sh
    Write-Output "lcd ~" "mput .ssh/id_rsa* .ssh/" "chmod 600 .ssh/*" | sftp $sshHost
  }
}
