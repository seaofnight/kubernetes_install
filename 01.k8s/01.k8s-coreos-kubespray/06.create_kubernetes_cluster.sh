#!/bin/bash 

cd kubespray
ansible-playbook -vvvv --become-user=root -i inventory/mycluster/hosts.ini cluster.yml  


#--start-at-task="kubernetes/kubeadm : Create kubeadm token for joining nodes with 24h expiration (default)"
