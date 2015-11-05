#!/bin/bash

# This script is for Red Hat compatible Linux that supports YUM package installer.
# It is going to install if not already installed:
# 1. Programming language support - C++ Python Perl PHP
# 2. Latest Java run-time environment for Internet browsers
# 3. Latest Java software development kits
#    Programming platform - NetBeans
# 4. Newest Linux kernel and kernel for developers
# 5. Flash player for internet browser
# 6. Mail client - Thunderbird
# 7. PDF viewer - Okular
# 8. Multimedia player - VLC
# 9. BitTorrent client - Transmission
# 10. Working with virtual machines using KVM


echo "OS:" `uname -sr`
echo "Processor type:" `uname -p`

# 1. Programming language support - C++ Python Perl PHP
yum install -y gcc python perl php


# 2. Latest Java run-time environment for Internet browsers
firefox http://java.com/en/download/manual.jsp


# 3. Latest Java software development kits
#    Programming platform - NetBeans
firefox http://www.oracle.com/technetwork/java/javase/downloads/jdk-netbeans-jsp-142931.html


# 4. Newest Linux kernel and kernel for developers
yum install -y kernel
yum install -y kernel-devel


# 5. Flash player
# Let us suppose that Mozilla is already included in the Linux distributions
firefox https://get.adobe.com/flashplayer


# 6. Mail client - Thunderbird
yum install -y thunderbird


# 7. PDF viewer - Okular
yum install -y okular


# 8. VLC player - for Fedora. For other distributions see http://www.videolan.org
rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm
yum install -y vlc


# 9. BitTorrent client - Transimission
# When installing on Fedora no prerequisites are required.
# For other Linux distributions see http://geekery.altervista.org/dokuwiki/doku.php

# For RHEL/CentOS 5 i386 uncomment the lines below:
#	cd /etc/yum.repos.d/
#	wget http://geekery.altervista.org/geekery-el5-i386.repo
#
# For RHEL/CentOS 5 x86_64 uncomment the lines below:
#	cd /etc/yum.repos.d/
#	wget http://geekery.altervista.org/geekery-el5-x86_64.repo
#
# For RHEL/CentOS 6 i686 uncomment the lines below:
#	cd /etc/yum.repos.d/
#	wget http://geekery.altervista.org/geekery-el6-i686.repo
#
# For RHEL/CentOS 6 x86_64 uncomment the lines below:
#	cd /etc/yum.repos.d/
#	wget http://geekery.altervista.org/geekery-el6-x86_64.repo

yum install -y transmission


# 10. Working with virtual machines using KVM
yum install -y kvm libvirt virt-manager virt-install virt-clone virt-clone
