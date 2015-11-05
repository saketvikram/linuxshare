#!/bin/bash
# Prepares commands to set up port-security on a Cisco switch
# Port-security in this case is based on dynamically learned MAC address

switch_name=$1
port_name=$2

echo "! Switch $switch_name"
echo "! Configuration mismatch can happen if the port is in trunk mode"
echo "! Checking port status and counting No. of MAC address on the port"
echo "! If more than 1 MAC address then increase max allowed MACs"
echo "show interface $port_name status"
echo "show mac address interface $port_name"
echo "enable"
echo "configure terminal"
echo "interface $port_name"
echo "switchport port-security"
echo "switchport port-security maximum 1"
echo "switchport port-security mac-address sticky"
echo "end"
echo "show port-security interface $port_name"
echo ""

# Written by Pavlin Georgiev
# October 2015
