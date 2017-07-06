#!/bin/sh

#update and cleanup packages
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove

#install Apache
apt-get -y install apache2

#use apache configs on hosts machine
rm /etc/apache2/apache2.conf
ln -s /resources/apache/apache2.conf /etc/apache2/apache2.conf

#install supervisord
apt-get install python-setuptools
easy_install supervisor
