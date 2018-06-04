# Configure vagrant vm
# http://docs.ansible.com/ansible/latest/scenario_guides/guide_vagrant.html
Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"

  # Disable the new default behavior introduced in Vagrant 1.7, to
  # ensure that all Vagrant machines will use the same SSH key pair.
  # See https://github.com/mitchellh/vagrant/issues/5005
  #config.ssh.insert_key = false
  #config.vm.network :private_network, ip: "192.168.64.222"

  config.vm.provider "virtualbox"
  
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "target_vagrant.yml"
  end
end