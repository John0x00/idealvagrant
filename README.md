
#Ideal Vagrant Setup

Setup for the ideal virtual machine for PHP LAMP development.

The core components used to manage dependencies are Puppet, Puppet Librarian, Phing and Composer.

You can customise this setup to fit your needs very easily; but by default the following is installed on the Virtual Machine  

- Ubuntu-64bit
- PHP
- MySQL Server and Client
- Apache 
- PHP QA Tools (PHP Unit, Xdebug)

##Install 

- VirtualBox https://www.virtualbox.org/wiki/Downloads

- Vagrant http://www.vagrantup.com/

- ####Vagrant Plugins
```
D:\idealvagrant> vagrant plugin install vagrant-hostmanager
D:\idealvagrant> vagrant plugin install vagrant-cachier
``` 


##Setup

### 1. Vagrantfile 

```
# D:\idealbagrant\Vagrantfile

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
 
 ...
 
```

### 2. Puppetfile
### 3. Puppet Manifests
### 4. Composer 