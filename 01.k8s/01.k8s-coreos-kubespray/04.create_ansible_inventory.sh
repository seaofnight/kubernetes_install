#!/bin/bash

cat << EOF > kubespray/inventory/mycluster/hosts.ini
[all]
core-01 ansible_host=172.17.8.101 ip=172.17.8.101 etcd_member_name=core-01
core-02 ansible_host=172.17.8.102 ip=172.17.8.102
core-03 ansible_host=172.17.8.103 ip=172.17.8.103

[kube-master]
core-01

[kube-node]
core-01
core-02
core-03

[etcd]
core-01

[k8s-cluster:children]
kube-node
kube-master

[all:vars]
ansible_python_interpreter=/opt/bin/python
bin_dir=/opt/bin

EOF

cat kubespray/inventory/mycluster/hosts.ini
