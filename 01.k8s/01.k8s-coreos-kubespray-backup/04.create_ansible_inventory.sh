#!/bin/bash

cat << EOF > kubespray/inventory/mycluster/hosts.ini
[all]
k8s-master ansible_host=172.17.8.100 ip=172.17.8.100 etcd_member_name=k8s-master
core-01 ansible_host=172.17.8.101 ip=172.17.8.101
#di7-05 ansible_host=10.20.30.14 ip=10.20.30.14

[kube-master]
k8s-master 

[kube-node]
k8s-master 
core-01
#di7-04
#di7-05

[etcd]
k8s-master 

[k8s-cluster:children]
kube-node
kube-master

[all:vars]
ansible_python_interpreter=/opt/bin/python
bin_dir=/opt/bin

EOF

cat kubespray/inventory/mycluster/hosts.ini
