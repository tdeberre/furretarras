#!/bin/bash

file="/etc/apt/apt.conf.d/05proxy"
touch "$file"
check=`cat $file | grep "Acquire::http::Proxy \"http://192.168.11.230:3142\";"`
if [ ! -z "$check" ]
then
	echo "Le proxy est déjà installé"
else
	echo "" >> $file && echo "Acquire::http::Proxy \"http://192.168.11.230:3142\";" >> $file
	echo "Le proxy a bien été ajouté"
fi

#apt update
#apt install mariadb-server
mysql -f -v -e 'create database furetDB;'
mysql -f -v -D 'furetDB' -e 'create table produits;'
#mysql -f -v -D='furetDB' -e='create table auteurs;'
#mysql -f -v -D='furetDB' -e='create table ecrire;'
#mysql -f -v -D='furetDB' -e='create table editeurs;'
#mysql -f -v -e="grant all privileges on furetDB.* to 'dartuser'@'localhost' identified by 'password';"
#mysql -f -v -e='flush privileges;'

