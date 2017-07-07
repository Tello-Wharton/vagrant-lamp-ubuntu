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

#install MariaDB
apt-get -y install mariadb-server
systemctl start mysql

cat << EOF | mysql
	use mysql;
	update user set plugin='' where User='root';
	flush privileges;
	SET PASSWORD FOR 'root'@'localhost' = PASSWORD('congrats');
EOF

#install PHP
apt-get -y install php7.0 php-pear libapache2-mod-php7.0 php7.0-mysql

rm -r /var/www/html
ln -s /vagrant/html /var/www/html


echo "phpmyadmin phpmyadmin/internal/skip-preseed boolean true"	| debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect" 	| debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean false" 	| debconf-set-selections

apt-get -y install phpmyadmin

