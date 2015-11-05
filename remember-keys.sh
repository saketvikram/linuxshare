#!/bin/bash
clear
echo Trying to add SSH key to memory via SSH agent..
ssh-add /home/georgiev/.ssh/id_rsa
echo
echo List of SSH keys
ssh-add -l

