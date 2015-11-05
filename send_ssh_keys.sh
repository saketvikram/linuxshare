#/bin/bash

clear

# Copies SSH public keys to several servers
for hostname in ankh rosret gw61 mrakoplas
do
	echo Copy SSH public keys to server $hostname
	scp $HOME/.ssh/*.pub $hostname:.ssh/
done
