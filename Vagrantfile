Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
  
    config.vm.define "web" do |web|
      web.vm.network "private_network", type: "dhcp"
    end
  
    config.vm.define "db" do |db|
      db.vm.network "private_network", type: "dhcp"
    end
  end
  