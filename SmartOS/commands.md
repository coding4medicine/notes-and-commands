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


