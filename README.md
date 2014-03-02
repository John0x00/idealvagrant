
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

No setup in necessary but you can modify anything listed below to customize the setup to meet your needs.


 
##Staring the Virtual Machine
```
D:\idealvagrant> vagrant up
Bringing machine 'box' up with 'virtualbox' provider...
[box] Importing base box 'precise64'...
[box] Matching MAC address for NAT networking...
[box] Setting the name of the VM...
[box] Clearing any previously set forwarded ports...
[box] Creating shared folders metadata...
[box] Clearing any previously set network interfaces...
[box] Preparing network interfaces based on configuration...
[box] Forwarding ports...
[box] -- 22 => 2222 (adapter 1)
[box] Running 'pre-boot' VM customizations...
[box] Booting VM...
[box] Waiting for machine to boot. This may take a few minutes...

 ... Followed by the puppet output ...
 
```

The server is now up and running.

**Server Information:**
- IP: 192.168.33.10
- Login: vagrant
- Password: vagrant
- Mysql Root Password: vagrant
- Domain: http://idealvagrant.loc
- Docroot: ./web/

##Customizations

### 1. Vagrantfile 

```
# D:\idealvagrant\Vagrantfile

### VAGRANT CONFIGURATION 

# Name of the Virtual Machine that appears in Virtual Box
VAGRANT_BOXNAME = "idealvagrant" 
# IP Address 
VAGRANT_IPADDRESS = "192.168.33.10" 
# Hostname
VAGRANT_HOSTNAME = "idealvagrant" 
# List of domain aliases (these will be added to host files)
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
```
# D:\idealvagrant\puppet\Puppetfile

forge "http://forge.puppetlabs.com"

mod 'example42/apache', '2.1.2'
mod 'example42/mysql', '2.1.3'
mod 'example42/php', '2.0.9'
mod 'puppetlabs/apt', '1.3.0'
mod 'puppetlabs/stdlib', '4.1.0'

```

### 3. Puppet Manifests

D:\idealvagrant\puppet\manisfests\main.pp
- main.pp
- basic.pp
- apache.pp - setup for default vhost
- mysql.pp - includes example to create database table, username and password
- php.pp - includes examples to modify php ini setting or add extensions using conf.d
- phpqatools.pp 
- servertools.pp
- composer.pp

### 4. Composer 

```
# D:\idealvagrant\composer.json
{
    "require": {
    	"swiftmailer/swiftmailer": "v5.0.3"
 }
}
```