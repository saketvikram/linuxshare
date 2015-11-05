#!/bin/bash
# Opens file with passwords, decrypts it, reads/makes changes, close and
# encrypt again

work_dir=$HOME/Work
encr_password_file=switch_config_template.txt.gpg
unencr_password_file=switch_config_template.txt

cd $work_dir
clear
echo Decrypting the file with passwords $encr_password_file
gpg $encr_password_file
# Exit code in bash = $?
if [ $? -eq 0 ]
then
	echo Decryption was succesful.
	vim $unencr_password_file
	if [ $? -eq 0 ]
	then
		echo File is ready for encryption.
	else
		echo Error occured when viewing the file.
	fi
else
	echo Problem when decrypting the file $encr_password_file
	exit
fi

echo Encrypting the file with passwords
gpg -c $unencr_password_file
# Exit code in bash = $?
if [ $? -eq 0 ]
then
	echo File $unencr_password_file was succesfully encrypted.
	rm $unencr_password_file
	if [ $? -ne 0 ]
	then
		echo Could not delete the unenrypted file $unecr_password_file.
		echo Warning: passwords can be seen in clear text!
	fi
else
	echo Problem occured when encrypting the file.
fi
cd $HOME
