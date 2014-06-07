neo4j-cluster
=============

This repo allows you to build a 3-node Neo4j HA-cluster with packer, vagrant and virtualbox on Ubuntu-14.04 


Requirements
------------
* Packer
* Vagrant
* plugin vagrant-vbguest
* plugin vagrant-hostmanager
* Virtualbox

Directions
------------
1. Clone repo and change dir into neo4j-cluster
2. Build the neo4j box `packer build neo4j.json`
2. Add the box to vagrant `vagrant box add neo4j ./neo4j.box`
3. Start the cluster `vagrant up`
4. Navigate to `172.16.0.4:7474/webadmin->server info->High Availability` and you should see all nodes connected
