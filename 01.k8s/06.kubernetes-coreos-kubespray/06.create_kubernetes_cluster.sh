#!/bin/bash 

cd kubespray
ansible-playbook --become-user=core --private-key=~/.ssh/id_rsa.pub  -i inventory/mycluster/hosts.ini cluster.yml
