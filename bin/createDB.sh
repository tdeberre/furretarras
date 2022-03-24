#!/bin/bash

#apt update
#apt install mariadb-server
mysql -f -v -e 'create database furetDB;'
mysql -f -v -D 'furetDB' -e 'create table produits;'
#mysql -f -v -D='furetDB' -e='create table auteurs;'
#mysql -f -v -D='furetDB' -e='create table ecrire;'
#mysql -f -v -D='furetDB' -e='create table editeurs;'
#mysql -f -v -e="grant all privileges on furetDB.* to 'dartuser'@'localhost' identified by 'password';"
#mysql -f -v -e='flush privileges;'

