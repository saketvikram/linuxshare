#!/bin/bash
# Connects to a Samba share over the network
# Takes 3 parameters
share_name=//147.251.96.96/Upload # remote resource
user_name=georgiev
local_dir=/mnt/tmp # where the remote resource will be mounted

# Listing shared resources on a Samba server
echo $share_name
echo $user_name
echo $local_dir

sudo mount $share_name $local_dir -o username=$user_name
