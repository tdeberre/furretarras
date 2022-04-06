#!/bin/bash

mkdir .ssh
eval "ssh-keygen -f ./.ssh/id_rsa -P 'btsinfo' -b 4096 -t rsa"
eval "$(ssh-agent -s)"
ssh-add ./.ssh/id_rsa
cat ./.ssh/id_rsa.pub