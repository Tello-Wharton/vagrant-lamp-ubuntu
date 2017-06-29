#!/bin/sh

#update and cleanup packages
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove

#install Apache
apt-get -y install apache2