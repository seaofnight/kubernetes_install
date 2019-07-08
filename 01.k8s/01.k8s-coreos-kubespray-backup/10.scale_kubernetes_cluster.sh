#!/bin/bash 

cd kubespray
ansible-playbook -vvv -b -i inventory/mycluster/hosts.ini scale.yml
