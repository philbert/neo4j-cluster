# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  # Assuming you named the packer-built box neo4j, otherwise use the linuxspecialist box from vagrantcloud
  config.vm.box                      = "neo4j"
  #config.vm.box                      = "linuxspecialist/ubuntu-14.04"

  # Don't need this any more as everything is already provisioned in the box
  #config.vm.provision 'shell', path: 'bootstrap.sh'

  # Neo4j node 1
  config.vm.define 'node1' do |node1|
    node1.vm.network :private_network, ip: "172.16.0.4"
    node1.vm.hostname = 'node1.localnet'
    node1.vm.provision "shell", inline: "sudo sed -i 's/^#ha.server_id=/ha.server_id=1/g' /etc/neo4j/neo4j.properties"
    node1.vm.synced_folder "./graph.db/", "/var/lib/neo4j/data/graph.db", type: "rsync", rsync__args: "-zvrd", owner: "neo4j", group: "nogroup"
    node1.vm.provider :virtualbox do |vbox|
      vbox.customize ["modifyvm", :id, "--memory", "512"]
    end
  end

  # Neo4j node 2
  config.vm.define 'node2' do |node2|
    node2.vm.network :private_network, ip: "172.16.0.5"
    node2.vm.hostname = 'node2.localnet'
    node2.vm.provision "shell", inline: "sudo sed -i 's/^#ha.server_id=/ha.server_id=2/g' /etc/neo4j/neo4j.properties"
    node2.vm.synced_folder "./graph.db/", "/var/lib/neo4j/data/graph.db", type: "rsync", rsync__args: "-zvrd", owner: "neo4j", group: "nogroup"
    node2.vm.provider :virtualbox do |vbox|
      vbox.customize ["modifyvm", :id, "--memory", "512"]
    end
  end

  # node3 node config
  config.vm.define 'node3' do |node3|
    node3.vm.network :private_network, ip: "172.16.0.6"
    node3.vm.hostname = 'node3.localnet'
    node3.vm.provision "shell", inline: "sudo sed -i 's/^#ha.server_id=/ha.server_id=3/g' /etc/neo4j/neo4j.properties"
    node3.vm.synced_folder "./graph.db/", "/var/lib/neo4j/data/graph.db", type: "rsync", rsync__args: "-zvrd", owner: "neo4j", group: "nogroup"
    node3.vm.provider :virtualbox do |vbox|
      vbox.customize ["modifyvm", :id, "--memory", "512"]
    end
  end

  # Need the vagrant-hostmanager plugin for the hosts provisioner. It not strictly neessary to get the cluster working
  config.vm.provision :hosts
  # We still need line to restart the neo4j-service after setting the ha.server_id
  config.vm.provision "shell", inline: "sudo service neo4j-service restart"

end
