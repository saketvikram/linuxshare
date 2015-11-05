#!/bin/bash
# Creates DHCP, DNS and Cisco switch configuration.
# Input parameters are read from a TAB-SEPARATED file and passed as command-line to other scripts
# Parameters are separated by spaces and their order is:
# 1. host_name
# 2. ip_address
# 3. mac_address
# 4. vlan_number
# 5. switch_name
# 6. port_number
# The script does not change anything on DHCP or DNS server. It simple creates text file
# from which co
mail_relay_server=relay.muni.cz
domain_name=priv.phil.muni.cz

input_file=$HOME/host_list.in
# Four output files with different purpouse. Finally their contents are concatenated into one file."
output_file1=$HOME/dhcp.conf
output_file2=$HOME/dns.conf
output_file3=$HOME/dns_rev.conf
output_file4=$HOME/switch.conf
output_file_final=$HOME/dhcp_dns_switch.conf


# Deletes the contents of all 5 output files if exist. If not, creates empty files
echo -n > $output_file1
echo -n > $output_file2
echo -n > $output_file3
echo -n > $output_file4
echo -n > $output_file_final


# Opens the input file and reads it line by line
cat $input_file | while read line
do
# Each line has 7 entries separated by tabs
host_name=`echo $line   | cut -d" " -f1`
ip_address=`echo $line  | cut -d" " -f2`
mac_address=`echo $line | cut -d" " -f3`
vlan_number=`echo $line | cut -d" " -f4`
switch_name=`echo $line | cut -d" " -f5`
port_number=`echo $line | cut -d" " -f6`

# Creates new DHCP record
create_dhcp_record.sh $host_name $ip_address $mac_address $switch_name $port_number >> $output_file1

# Creates new DNS record
create_dns_record.sh $host_name $ip_address $mail_relay_server >> $output_file2


# Creates new reverse DNS record
create_rev_dns_record.sh $host_name $domain_name $ip_address >> $output_file3


# Creates Cisco switch configuration for single port
# Port description repeates the host name but with prefix PC.
# Example: PC sales01, PC class01
echo "! Switch name" $switch_name >> $output_file4
port_description="$host_name"
create_port_config.sh $vlan_number $port_number "$port_description" >> $output_file4
# Quotes are need to pass a parameter that contain spaces
echo >> $output_file4

done # while read line
echo "end" >> $output_file4
echo "show int status" >> $output_file4
echo "write" >> $output_file4

# Concatenates the contents of all output files into one. Then deletes them leaving the file with final result only.
echo "# New DHCP records" >> $output_file_final
cat $output_file1 >> $output_file_final

echo "# New DNS records" >> $output_file_final
cat $output_file2 >> $output_file_final

echo "# New reverse DNS records" >> $output_file_final
cat $output_file3 >> $output_file_final

echo "! New switch port configuration" >> $output_file_final
cat $output_file4 >> $output_file_final

rm --force $output_file1
rm --force $output_file2
rm --force $output_file3
rm --force $output_file4

kate $output_file_final


# Written by Pavlin Georgiev
# Created in December 2014
# Updated on 13 Oct 2015
