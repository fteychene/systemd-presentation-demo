$script = <<-SCRIPT
apt-get update
apt-get install -y nginx redis-server postgresql
systemctl stop redis-server
systemctl stop postgresql
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.synced_folder "units", "/srv/demo"
  config.vm.provision "shell", inline: $script
  config.vm.network "private_network", ip: "192.168.50.1"
end