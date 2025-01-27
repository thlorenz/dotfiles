UBUNTU="Ubuntu 22.04"

luzid-ubuntu-start-headless () {
  VBoxManage startvm "$UBUNTU" --type headless
}

luzid-ubuntu-start () {
  VBoxManage startvm "$UBUNTU"
}

luzid-ubuntu-stop () {
  VBoxManage controlvm "$UBUNTU" acpipowerbutton
}

luzid-ubuntu-cpus () {
  VBoxManage modifyvm "$UBUNTU" --cpus "$1"
}

luzid-ubuntu-memory () {
  VBoxManage modifyvm "$UBUNTU" --memory "$1"
}

# https://docs.oracle.com/en/virtualization/virtualbox/6.0/admin/cpuhotplug.html
luzid-ubuntu-hotplug-on () {
  VBoxManage modifyvm "$UBUNTU" --cpuhotplug on
}

luzid-ubuntu-hotplug-off () {
  VBoxManage modifyvm "$UBUNTU" --cpuhotplug off
}

luzid-ubuntu-cpu-plug () {
  VBoxManage modifyvm "$UBUNTU" --plugcpu "$1"
}

luzid-ubuntu-cpu-unplug () {
  VBoxManage modifyvm "$UBUNTU" --unplugcpu "$1"
}

export PROTOC=`which protoc`
