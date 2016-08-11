# clean reinstall (CAUTION - deletes everything)

zfs set smartdc:factoryreset=yes zones/var
reboot


# Shutdown

shutdown -y -g0 -i5
halt


# Zone setup

imgadm avail | grep ubuntu

imageadm import []

vmadm create -f [].json

# Get zone info

vmadm get []

# Installation at test site

IP = 192.168.0.101 dhcp

default gateway = 192.168.0.1 none

dns domain example.com

# Changing IP address of machine

In /usbkey/config, change IP, gateway

# To do ssh without password


# Networking setup

dladm create-vlan -l bnx3 -v1000
dnadm create-vnic -l bnx3 gw0-v1000
dladm create-addr -T static -a10.0.0.1 gw0/v4
routeadm -u -e ipv4-forwarding

# Check network

ipfstat -io


# commands to change firewall settings

change files /etc/ipf/ipnat.conf or /etc/ipf/ipf.conf

Then run -

/usr/sbin/ipnat -C -v -f /etc/ipf/ipnat.conf

/usr/sbin/ipf -E -Fa -v -f /etc/ipf/ipf.conf

# command to turnoff dtrace during ruby install

after following the steps from digitalocean -
https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-14-04

1.      CONFIGURE_OPTS="--disable-dtrace" rbenv install 2.1.2
2.      rvm install --reconfigure -C --disable-dtrace ruby-2.0.0-p594
3.      chmod -s /usr/sbin/dtrace

https://github.com/rbenv/rbenv/issues/708
http://stackoverflow.com/questions/23918889/trying-to-install-ruby-2-1-2-with-rbenv-on-osx-build-failed

