vim /etc/dhcpd.conf
clear
echo Validating syntax of DHCP configuration...
echo
dhcpd -t -cf /etc/dhcpd.conf
echo
