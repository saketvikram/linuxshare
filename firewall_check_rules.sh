#!/bin/bash
# Lists firewall rules in a file, then shows it to the user
clear
echo Reading rules from firewall. Please wait...
sudo service iptables status > ~/firewall_rules.txt
vi ~/firewall_rules.txt
