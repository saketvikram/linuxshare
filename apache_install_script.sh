#!/bin/bash
# Script for installing Apache web server under Linux Fedora

PREFIX=/usr/local/apache2
APACHE_PKG=http://apache.miloslavbrada.cz/httpd/httpd-2.4.12.tar.gz
APACHE_APR=http://mirror.hosting90.cz/apache/apr/apr-1.5.1.tar.gz
APACHE_APR_UTIL=http://mirror.hosting90.cz/apache/apr/apr-util-1.5.4.tar.gz

# Downloading Apache HTTP Server, Runtime Library, Utilities
wget $APACHE_PKG && sleep 5 && wget $APACHE_APR && sleep 5 && wget $APACHE_APR_UTIL

# Checking the exit status of previous command
if [ $? -eq 0 ]
then
	# Unarchive Apache packages
	tar xzf httpd-2.4.12.tar.gz && cd httpd-2.4.12
	if [ $? -eq 0 ]
	then
	    tar xzf ../apr-1.5.1.tar.gz && mv apr-1.5.1 ./srclib/apr
	    if [ $? -eq 0 ]
	    then
		tar xzf ../apr-util-1.5.4.tar.gz && mv apr-util-1.5.4 ./srclib/apr-util
		if [ $? -eq 0 ]
		then
		    # Apache web server can be installed dir httpd-2.4.12
		    ./configure --with-included-apr
		    if [ $? -eq 0 ]
		    then
			clear
			echo Installation of Apache server was succesful.
		    else
			echo Error when install Apache web server.
		    fi
		else
		    echo Error when extracting APR Utilities package.
		fi
	    else
		echo Error when extracting APR package.
	    fi
	else
	    echo Error when extracting Apache package.
	fi 
else
    echo Error when Downloading Apache packages.
fi