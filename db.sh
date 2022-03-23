##!/bin/bash

# root Password setzen, damit kein Dialog erscheint und die Installation haengt!
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password Passw0rd5'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password Passw0rd5'

# Installation
sudo apt-get install -y mysql-server

# MySQL Port oeffnen
sudo sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# User fuer Remote Zugriff einrichten - aber nur fuer Host web 10.10.1.10
mysql -uroot -pPassw0rd5 <<%EOF%
	CREATE USER 'root'@'10.10.1.10' IDENTIFIED BY 'Passw0rd5';
	GRANT ALL PRIVILEGES ON *.* TO 'root'@'10.10.1.10' IDENTIFIED BY 'Passw0rd5' WITH GRANT OPTION;
	FLUSH PRIVILEGES;
	CREATE DATABASE M300;
	USE M300;
	CREATE TABLE M300(Titel VARCHAR(50), Beschreibung VARCHAR(50));
	INSERT INTO M300 VALUE ("M300 Services","Plattformuebergreifende Dienste");
	quit
%EOF%

# Restart fuer Konfigurationsaenderung
sudo service mysql restart