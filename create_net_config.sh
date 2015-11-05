#!/bin/bash
# Creates template for PC configuration in DNS, DHCP server, and Cisco switch setup
# Takes the parameters from the command-line in this order:
# 1. host name
# 2. IP address
# 3. MAC address
# 4. VLAN number
# 5. Switch name
# 6. Port number (example: Fa0/5, Gi0/7, Gi1/0/12)
# 7. Owner's name

host_name=$1
ip_address=$2
mac_address=$3
vlan_number=$4
switch_name=$5
port_number=$6

echo "New DHCP record"
echo "host $host_name { #$switch_name $port_number"
echo "	hardware ethernet $mac_address;"
echo "	fixed-address $ip_address;"
echo "}"
echo
echo "New DNS record"
echo $host_name"		IN A "$ip_address
echo "		IN MX 50 relay.muni.cz."
echo

last_byte=`echo $ip_address | cut -d"." -f4`
echo "New reverse record"
echo $last_byte"		IN PTR  "$host_name".priv.phil.muni.cz."
echo
echo
echo "! Switch setup"
echo "Check where the PC to which port is connected on the switch."
echo "Check if multiple network devices share the same port."
# Converting the MAC address from aa:bb:cc:dd:ee:dd to aaaa.bbbb.cccc
echo "show mac address | incl "$mac_address | sed 's/\([0-9a-f][0-9a-f]\):\([0-9a-f][0-9a-f]\):\([0-9a-f][0-9a-f]\):\([0-9a-f][0-9a-f]\):\([0-9a-f][0-9a-f]\):\([0-9a-f][0-9a-f]\)/\1\2.\3\4.\5\6/'
echo "show mac address int "$port_number
echo 
echo "configure terminal"
echo "interface "$port_number
echo "shutdown"
echo "description "$host_name
echo "switchport access vlan "$vlan_number
echo "no shutdown"
echo "end"
echo
echo "show int "$port_number" status"
echo "write"

# Written by Pavlin Georgiev
# Created in December 2014
# Last update: 8 Oct 2015

