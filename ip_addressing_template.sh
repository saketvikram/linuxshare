#!/bin/bash
input_file=$HOME/switch_list.in
output_file=$HOME/switch_configs.txt

# Configuration template for Cisco switch
# configure terminal
# interface vlan138
# ip address 10.38.192.___ 255.255.255.0
# exit
# ip default-gateway 10.38.192.254
# end
# write


# Reading switch list in a loop
cat $input_file | while read line; do
# Reading the switch name
switch_name=$(echo $line | cut -d" " -f1)

# Reading the IP address
ip_addr=$(echo $line | cut -d" " -f5)

echo "! $switch_name"
echo "configure terminal"
echo "interface vlan138"
echo "ip address $ip_addr 255.255.255.0"
echo "exit"
echo "ip default-gateway 10.38.192.254"
echo "end"
echo "write"
echo
echo
done
# End of loop reading switch list