#!/bin/bash

cat << EOF > kubespray/inventory/mycluster/hosts.ini
[all]
di7-03 ansible_host=10.20.30.12 ip=10.20.30.12 etcd_member_name=di7-03
di7-04 ansible_host=10.20.30.13 ip=10.20.30.13
di7-05 ansible_host=10.20.30.14 ip=10.20.30.14

[kube-master]
di7-03 

[kube-node]
di7-03 
di7-04
di7-05

[etcd]
di7-03 

[k8s-cluster:children]
kube-node
kube-master

EOF

cat kubespray/inventory/mycluster/hosts.ini
