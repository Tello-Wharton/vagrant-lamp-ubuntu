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

#install supervisor
apt-get -y install supervisor

#use supervisor configs on hosts machine
rm -r /etc/supervisor
ln -s /resources/supervisord /etc/supervisor
