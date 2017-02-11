VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define :web1 do |web1|
    web1.berkshelf.enabled = true
    web1.omnibus.chef_version = '12.10.24'
    web1.vm.box = "ubuntu/xenial64"
    web1.vm.hostname = "web1.localdomain"
    web1.vm.network :private_network, ip: '10.0.1.41'
    web1.vm.provision :chef_solo do |chef|
      chef.channel = "stable"
      chef.version = "12.10.24"
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.run_list = [ "role[web]" ]
      chef.json = {
        "rgang" => {
          "html" => "I'm server 1"
        }
      }
    end
  end

  config.vm.define :web2 do |web2|
    web2.berkshelf.enabled = true
    web2.omnibus.chef_version = '12.10.24'
    web2.vm.box = "ubuntu/xenial64"
    web2.vm.hostname = "web2.localdomain"
    web2.vm.network :private_network, ip: '10.0.1.42'
    web2.vm.provision :chef_solo do |chef|
      chef.channel = "stable"
      chef.version = "12.10.24"
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.run_list = [ "role[web]" ]
      chef.json = {
        "rgang" => {
          "html" => "I'm server 2"
        }
      }
    end
  end

  config.vm.define :balancer do |balancer|
    balancer.berkshelf.enabled = true
    balancer.omnibus.chef_version = '12.10.24'
    balancer.vm.box = "ubuntu/xenial64"
    balancer.vm.hostname = "lb.localdomain"
    balancer.vm.network :private_network, ip: '10.0.1.40'
    balancer.vm.provision :chef_solo do |chef|
      chef.channel = "stable"
      chef.version = "12.10.24"
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.run_list = [ "role[balancer]" ]
      chef.json = {
        "haproxy" => {
          "members" => [{
            "hostname" => "web1",
            "ipaddress" => "10.0.1.41",
            "port" => 80,
            "weight" => 1,
            "max_connections" => 100
            }, {
              "hostname" => "web2",
              "ipaddress" => "10.0.1.42",
              "port" => 80,
              "weight" => 1,
              "max_connections" => 100
            }]
          }
      }
    end
  end

  config.vm.define :ci do |ci|
    ci.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 2
    end
    ci.berkshelf.enabled = true
    ci.omnibus.chef_version = '12.10.24'
    ci.vm.box = "ubuntu/xenial64"
    ci.vm.hostname = "ci.localdomain"
    ci.vm.network :private_network, ip: '10.0.1.50'
    ci.vm.provision :chef_solo do |chef|
      chef.channel = "stable"
      chef.version = "12.10.24"
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.run_list = [ "role[ci]" ]
      chef.json = {
        "jenkins" => {
          "master" => {
              "jvm_options" => '-Djenkins.install.runSetupWizard=false'
          }
        }
      }
    end
  end

end
