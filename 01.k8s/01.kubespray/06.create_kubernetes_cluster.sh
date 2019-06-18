#!/bin/bash 

cd kubespray
ansible-playbook -b -i inventory/mycluster/hosts.ini cluster.yml
