#!/bin/bash 

cd kubespray
ansible-playbook -b -i inventory/mycluster/hosts.ini cluster.yml --limit @/root/kubernetes_install/01.k8s/01.kubespray/kubespray/cluster.retry 
