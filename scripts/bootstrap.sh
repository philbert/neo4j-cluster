#!/bin/sh

echo "Installing Neo4j"
sudo -s
wget -O - http://debian.neo4j.org/neotechnology.gpg.key | apt-key add -
echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list
apt-get update -y
apt-get upgrade -y
apt-get install -y openjdk-7-jdk neo4j-enterprise

echo "Configuring Neo4j"
sed -i 's/^#org.neo4j.server.database.mode/org.neo4j.server.database.mode/g' /etc/neo4j/neo4j-server.properties
sed -i 's/^#ha.initial_hosts.*/ha.initial_hosts=172.16.0.4:5001,172.16.0.5:5001,172.16.0.6:5001/g' /etc/neo4j/neo4j.properties
sed -i 's/^#org.neo4j.server.webserver.address/org.neo4j.server.webserver.address/g' /etc/neo4j/neo4j-server.properties

echo "*   soft    nofile  65536" >> /etc/security/limits.conf
echo "*   hard    nofile  65536" >> /etc/security/limits.conf
echo "session    required   pam_limits.so" >> /etc/pam.d/su

#service neo4j-service start
echo "Finished bootstrap"
