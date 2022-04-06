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

apt update
apt install mariadb-server

mysql -f -v -e 'create database furretDB;'
mysql -f -v -D 'furretDB' -e 'create table Editeurs (IDEditeur int primary key not null auto_increment , NomEditeur varchar(30) not null , AdresseEditeur varchar(50) not null);'
mysql -f -v -D 'furretDB' -e 'create table Auteurs (IDAuteur int primary key not null auto_increment , NomAuteur varchar(30) not null , PrenomAuteur varchar(30) not null);'
mysql -f -v -D 'furretDB' -e 'create table Produits (IDProduit int primary key not null auto_increment , NomProduit varchar(30) not null , TypeProduit varchar(30) not null , PrixProduit float not null , quantiteProduit int not null , IDEditeur int not null , foreign key (IDEditeur) references Editeurs(IDEditeur));'
mysql -f -v -D 'furretDB' -e 'create table Ecrire (IDAuteur int not null , IDProduit int not null , foreign key (IDAuteur) references Auteurs(IDAuteur) , foreign key (IDProduit) references Produits(IDProduit));'
mysql -f -v -e "grant all privileges on furretDB.* to 'dartuser'@'localhost' identified by 'btsinfo';"
mysql -f -v -e 'flush privileges;'