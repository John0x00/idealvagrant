

### VAGRANT CONFIGURATION 

# Name of the Virtual Machine that appears in Virtual Box
VAGRANT_BOXNAME = "idealvagrant" 
# IP Address 
VAGRANT_IPADDRESS = "192.168.33.10" 
# Hostname
VAGRANT_HOSTNAME = "idealvagrant" 
# List of domain alaises (these will be added to host files)
VAGRANT_ALIASES = "vagant.loc vagrant.local" 
#Amount of Memory in MB
VAGRANT_MEMORY = "512" 
# Name of the base box
VAGRANT_BOX = "precise64" 
# URL to the base box
VAGRANT_BOX_URL = "http://files.vagrantup.com/precise64.box"



# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  
  config.vm.box = VAGRANT_BOX
  config.vm.box_url = VAGRANT_BOX_URL

  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.customize ["modifyvm", :id, "--name", VAGRANT_BOXNAME]
    virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    virtualbox.customize ["modifyvm", :id, "--memory", VAGRANT_MEMORY]
  end
  
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  config.vm.define "box" do |node|
    node.vm.hostname = VAGRANT_HOSTNAME
    node.vm.network :private_network, ip: VAGRANT_IPADDRESS
    node.hostmanager.aliases = VAGRANT_ALIASES
  end
  
  config.vm.provision :shell, :path => "shell/bootstrap.sh"  
  
end
