$box_url = "https://app.vagrantup.com/bento/boxes/ubuntu-20.04/versions/202008.16.0/providers/virtualbox.box"
$box_dir = ".box"
$box_path = "${box_dir}/box.tar"
$ovf_path = "${box_dir}/box.ovf"
$vm_name = "vm"

Function Fetch() {
  mkdir $box_dir
  Invoke-WebRequest $box_url -o $box_path
  tar -xf $box_path -C $box_dir
}

Function Clean() {
  if (Test-path "~/VirtualBox VMs/${vm_name}") {
    Remove-Item -Recurse "~/VirtualBox VMs/${vm_name}"
  }
}

Function Create() {
  $ovf_file = [xml](Get-Content $ovf_path)
  $original_vm_name = $ovf_file.Envelope.VirtualSystem.Machine.name

  VBoxManage import $ovf_path --options importtovdi
  VBoxManage modifyvm $original_vm_name --name $vm_name
}

Function ModifyOnce() {
  VBoxManage modifyvm $vm_name --natpf1 "ssh,tcp,,2222,,22"

  $ports = 2800, 3000, 3035, 3333, 8000, 8080

  foreach ($port in $ports) {
    VBoxManage modifyvm $vm_name --natpf1 "tcp${port},tcp,,${port},,${port}"
  }

  VBoxManage sharedfolder add $vm_name --name sync --hostpath . --automount
}

Function Modify() {
  VBoxManage modifyvm $vm_name --memory (1024 * 3)
  VBoxManage modifyvm $vm_name --cpus 2
  VBoxManage modifyvm $vm_name --defaultfrontend headless
}

if ($Args[0] -eq "fetch") {
  Fetch
}
elseif ($Args[0] -eq "create") {
  Clean
  Create
  ModifyOnce
  Modify
  VBoxManage startvm $vm_name
}
elseif ($Args[0] -eq "modify") {
  Modify
}
elseif ($Args[0] -eq "del") {
  VBoxManage controlvm $vm_name poweroff
  VBoxManage unregistervm $vm_name --delete
}
elseif ($Args[0] -eq "start") {
  VBoxManage startvm $vm_name
}
elseif ($Args[0] -eq "savestate") {
  VBoxManage controlvm $vm_name savestate
}
elseif ($Args[0] -eq "poweroff") {
  VBoxManage controlvm $vm_name poweroff
}
