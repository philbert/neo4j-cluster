#!/bin/sh

echo "Beginning script"
#sleep 10
apt-get -y update
apt-get -y upgrade
apt-get install -y linux-headers-$(uname -r) virtualbox-guest-utils vim

sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
sed -i -e 's/%sudo  ALL=(ALL:ALL) ALL/%sudo  ALL=NOPASSWD:ALL/g' /etc/sudoers
echo "UseDNS no" >> /etc/ssh/sshd_config


