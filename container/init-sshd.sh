#!/bin/bash

# prepare config
sed -i  "s/#Port 22/Port 2222/g" /etc/ssh/sshd_config
sed -i  "s/#PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
sed -i  "s/#AllowAgentForwarding yes/AllowAgentForwarding yes/g" /etc/ssh/sshd_config
sed -i  "s/#AllowTcpForwarding yes/AllowTcpForwarding yes/g" /etc/ssh/sshd_config

# restore sshd keys if available
if [ -f "/ssh/ssh_host_rsa_key.pub" ]; then
  cp /ssh/ssh_host_* /etc/ssh/
else
  rm /etc/ssh/ssh_host_*
  DEBIAN_FRONTEND=noninteractive dpkg-reconfigure openssh-server
  cp /etc/ssh/ssh_host_* /ssh/
fi

# create authorized keys
mkdir /root/.ssh/
cp /ssh/authorized_keys /root/.ssh/authorized_keys
chmod 400 -R /root/.ssh/

# start daemon
mkdir /run/sshd
/usr/sbin/sshd -D
