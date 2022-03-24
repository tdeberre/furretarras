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

mkdir .ssh
eval "ssh-keygen -f ./.ssh/id_rsa -P 'btsinfo' -b 4096 -t rsa"
eval "$(ssh-agent -s)"
ssh-add ./.ssh/id_rsa
cat ./.ssh/id_rsa.pub